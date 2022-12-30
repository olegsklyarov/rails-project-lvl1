# frozen_string_literal: true

module HexletCode
  class Text
    def build(attributes = {})
      attributes[:cols] = attributes.fetch :cols, '20'
      attributes[:rows] = attributes.fetch :rows, '40'
      Tag.build('textarea', attributes.compact)
    end
  end
end
