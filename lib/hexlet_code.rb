# frozen_string_literal: true

require_relative "hexlet_code/version"

# HexletCode module
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

  def self.form_for(entity, attributes = {})
    @entity = entity
    @inputs = []
    attributes[:action] = attributes[:url] || "#"
    attributes[:method] ||= "post"

    yield HexletCode

    Tag.build("form", attributes.except(:url)) { @inputs.join }
  end

  def self.input(property, options = {})
    if options[:as].nil?
      @inputs << Tag.build("input", name: property, type: "text", value: @entity[property])
    elsif options[:as] == :text
      @inputs << Tag.build("textarea", cols: "20", rows: "40", name: property) { @entity[property] }
    end
  end
end
