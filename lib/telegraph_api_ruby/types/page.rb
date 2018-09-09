require_relative 'struct'
require_relative 'core'
require_relative 'node'

module TelegraphApi
  module Types
    class Page < Struct
      attribute :path, Core::String
      attribute :url, Core::String
      attribute :title, Core::String
      attribute :description, Core::String
      attribute :views, Core::Integer

      attribute :author_name, Core::String.meta(omittable: true)
      attribute :author_url, Core::String.meta(omittable: true)
      attribute :image_url, Core::String.meta(omittable: true)
      attribute :content, Core::Array.of(Node).meta(omittable: true)
      attribute :can_edit, Core::Bool.meta(omittable: true)
    end
  end
end
