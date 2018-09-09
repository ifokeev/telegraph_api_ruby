require_relative 'struct'
require_relative 'core'
require_relative 'page'

module TelegraphApi
  module Types
    class PageList < Struct
      attribute :total_count, Core::Integer
      attribute :pages, Core::Array.of(Page)
    end
  end
end
