# frozen_string_literal: true

require_relative "hexlet_code/version"
require_relative "hexlet_code/tag"

module HexletCode
  def self.form_for(entity, attributes = {})
    @entity = entity
    @inputs = []
    attributes[:action] = attributes[:url] || "#"
    attributes[:method] ||= "post"

    yield HexletCode

    Tag.build("form", attributes.except(:url)) { @inputs.join }
  end

  def self.input(property, options = {})
    @inputs << Tag.build("label", for: property) { property.capitalize }
    if options[:as].nil?
      input_attributes = {
        name: property,
        type: "text",
        value: @entity[property]
      }
      @inputs << Tag.build("input", input_attributes.compact)
    elsif options[:as] == :text
      @inputs << Tag.build("textarea", cols: "20", rows: "40", name: property) { @entity[property] }
    end
  end

  def self.submit(caption = "Save")
    @inputs << Tag.build("input", type: "submit", value: caption)
  end
end
