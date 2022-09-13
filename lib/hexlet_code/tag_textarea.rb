# frozen_string_literal: true

require_relative 'tag'

module HexletCode
  class TagTextarea
    def self.build(property, value, attributes = {})
      attributes[:name] ||= property
      attributes[:cols] ||= '20'
      attributes[:rows] ||= '40'

      Tag.build('textarea', attributes.compact) { value }
    end
  end
end
