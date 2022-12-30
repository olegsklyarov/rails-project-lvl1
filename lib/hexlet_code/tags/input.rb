# frozen_string_literal: true

module HexletCode
  class Input
    def build(attributes = {})
      attributes[:type] ||= 'text'

      Tag.build('input', attributes.compact)
    end
  end
end
