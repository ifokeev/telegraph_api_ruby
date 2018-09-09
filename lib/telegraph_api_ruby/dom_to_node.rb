require 'oga'

module TelegraphApi
  class DomToNode
    attr_reader :data

    def self.call(*args)
      new(*args).call
    end

    def initialize(data)
      @data = data
    end

    def call
      dom_to_node(parse_html(data))[:children]
    end

    private

    def parse_html(data)
      Oga.parse_html(data)
    end

    def dom_to_node(dom_node)
      return dom_node.text if dom_node.is_a?(Oga::XML::Text)

      node_element = {
        children: []
      }

      if dom_node.is_a?(Oga::XML::Element)
        node_element[:tag] = dom_node.name
        node_element[:attrs] = {}

        Array(dom_node.attributes).each do |attr|
          node_element[:attrs][attr.name] = attr.value
        end
      end

      Array(dom_node.children).each do |child|
        node_element[:children].push(dom_to_node(child))
      end

      node_element
    end
  end
end
