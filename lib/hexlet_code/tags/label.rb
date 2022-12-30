# frozen_string_literal: true

module HexletCode
  class Label
    def build(property)
      Tag.build('label', for: property) { property.capitalize }
    end
  end
end
