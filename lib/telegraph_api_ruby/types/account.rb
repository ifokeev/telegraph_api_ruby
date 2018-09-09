require_relative 'struct'
require_relative 'core'

module TelegraphApi
  module Types
    class Account < Struct
      attribute :short_name, Core::String
      attribute :author_name, Core::String
      attribute :author_url, Core::String

      attribute :access_token, Core::String.meta(omittable: true)
      attribute :auth_url, Core::String.meta(omittable: true)
      attribute :page_count, Core::String.meta(omittable: true)
    end
  end
end
