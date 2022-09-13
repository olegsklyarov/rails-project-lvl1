# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/tag_form'
require_relative 'hexlet_code/tag_input'
require_relative 'hexlet_code/tag_label'
require_relative 'hexlet_code/tag_textarea'

module HexletCode
  def self.form_for(entity, attributes = {})
    @entity = entity
    @inputs = []
    yield HexletCode
    TagForm.build(@inputs.join, attributes)
  end

  def self.input(property, options = {})
    @inputs << TagLabel.build(property)
    if options[:as].nil?
      @inputs << TagInput.build(property, @entity[property], options.except(:as))
    elsif options[:as] == :text
      @inputs << TagTextarea.build(property, @entity[property], options.except(:as))
    end
  end

  def self.submit(caption = 'Save')
    @inputs << TagInput.build(nil, caption, { type: 'submit' })
  end
end
