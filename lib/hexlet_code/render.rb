# frozen_string_literal: true

module HexletCode
  class Render
    attr_reader :entity, :attributes, :tags

    def initialize(entity, attributes)
      @tags = []
      @entity = entity
      @attributes = attributes
    end

    def build_label(name)
      tags << Tag.build('label', for: name) { name.capitalize }
    end

    def build_tag(type, attributes)
      tags << HexletCode.const_get(type.capitalize).new.build(attributes)
    end

    def input(property, options = {})
      raise NoMethodError unless @entity.members.include?(property)

      input_type = options.fetch :as, :input
      input_attributes = {
        **options.except(:as),
        name: property,
        value: @entity[property]
      }

      build_label(property)
      build_tag(input_type, input_attributes)
    end

    def submit(value = 'Save')
      tags << Tag.build('input', type: 'submit', value:)
    end

    def render
      action = attributes.fetch :url, '#'
      method = attributes.fetch :method, 'post'

      Tag.build('form', action:, method:) { tags.join }
    end
  end
end
