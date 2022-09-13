# frozen_string_literal: true

require_relative 'tag'

module HexletCode
  class TagLabel
    def self.build(property)
      Tag.build('label', for: property) { property.capitalize }
    end
  end
end
