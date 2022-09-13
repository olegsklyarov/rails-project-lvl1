# frozen_string_literal: true

module HexletCode
  class TagInput
    def self.build(property, value, attributes = {})
      attributes[:name] ||= property
      attributes[:type] ||= 'text'
      attributes[:value] ||= value

      Tag.build('input', attributes.compact)
    end
  end
end
