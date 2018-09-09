require 'json'
require 'typhoeus'

module TelegraphApi
  class Request
    class ResponseError < StandardError; end

    attr_reader :path, :opts, :response_schema

    API_URL = 'https://api.telegra.ph/'.freeze

    def self.call(*args)
      new(*args).call
    end

    def initialize(path, opts = {}, response_schema = nil)
      @path = path
      @opts = opts
      @response_schema = response_schema
    end

    def call
      result = request(path, opts)
      response(result.body, response_schema)
    end

    private

    def request(path, body)
      Typhoeus.post("#{API_URL}/#{path}", body: body)
    end

    def response(data, type)
      json = JSON.parse(data, symbolize_names: true)

      if json[:ok] == true
        result = json[:result]
        (type && type[result]) || result
      else
        raise ResponseError, json[:error]
      end
    end
  end
end
