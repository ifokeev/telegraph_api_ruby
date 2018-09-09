require 'active_support/inflector'

require_relative 'types'

module TelegraphApi
  class Client
    API_URL = 'https://api.telegra.ph/'.freeze

    REQUEST_RESPONSE = {
      create_account: Types::Account,
      edit_account_info: Types::Account,
      get_account_info: Types::Account,
      revoke_access_token: Types::Account,
      create_page: Types::Page,
      edit_page: Types::Page,
      get_page: Types::Page,
      get_page_list: Types::PageList,
      get_views: Types::PageViews
    }.freeze

    def self.method_missing(method, *args, &block)
      path = ActiveSupport::Inflector.camelize(method.to_s, false)
      Request.call(path, *args, REQUEST_RESPONSE[method.to_sym])
    end

    def self.respond_to_missing?(method, include_all = false)
      REQUEST_RESPONSE[method.to_sym] || super
    end
  end
end
