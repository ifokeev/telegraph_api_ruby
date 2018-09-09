require_relative 'struct'
require_relative 'core'

module TelegraphApi
  module Types
    class PageViews < Struct
      attribute :views, Core::Integer
    end
  end
end
