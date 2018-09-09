require_relative 'struct'
require_relative 'core'

module TelegraphApi
  module Types
    class NodeElement < Struct
      Node = Core::String | NodeElement

      attribute :tag, Core::String
      attribute :attrs, Core::Hash
      attribute :children, Core::Array.of(Node).meta(omittable: true)
    end

    Node = Core::String | NodeElement
  end
end
