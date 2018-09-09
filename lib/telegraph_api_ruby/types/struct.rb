require 'dry-struct'
require 'dry-types'

module TelegraphApi
  module Types
    class Struct < Dry::Struct
      # throw an error when unknown keys provided
      input input.strict

      # convert string keys to symbols
      transform_keys(&:to_sym)

      # resolve default types on nil
      transform_types do |type|
        if type.default?
          type.constructor do |value|
            value.nil? ? Core::Undefined : value
          end
        else
          type
        end
      end
    end
  end
end
