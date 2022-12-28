# frozen_string_literal: true

module HexletCode
  class Tag
    SINGLE_TAGS = %w[br img input].freeze

    def self.generate_attributes_line(attributes = {})
      return '' if attributes.empty?

      attr_pairs = attributes.map { |key, value| "#{key}=\"#{value}\"" }
      " #{attr_pairs.join(' ')}"
    end

    def self.build(name, attributes = {})
      attr_line = generate_attributes_line(attributes)
      return "<#{name}#{attr_line}>" if SINGLE_TAGS.include? name

      body = yield if block_given?
      "<#{name}#{attr_line}>#{body}</#{name}>"
    end
  end
end
