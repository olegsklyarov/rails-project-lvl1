# frozen_string_literal: true

require_relative "hexlet_code/version"

module HexletCode
  # Generate HTML tag
  class Tag
    SINGLE_TAGS = %w[br img input].freeze

    def self.generate_attributes_line(attributes = {})
      attr_pairs = attributes.any? ? [""] : []
      attributes.each do |key, value|
        attr_pairs << "#{key}=\"#{value}\""
      end
      attr_pairs.join(" ")
    end

    def self.build(name, attributes = {})
      attr_line = generate_attributes_line(attributes)
      return "<#{name}#{attr_line}>" if SINGLE_TAGS.include? name

      body = yield if block_given?
      "<#{name}#{attr_line}>#{body}</#{name}>"
    end
  end
end
