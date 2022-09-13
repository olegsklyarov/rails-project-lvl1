# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload :Tag, 'hexlet_code/tag'
  autoload :TagForm, 'hexlet_code/tag_form'
  autoload :TagInput, 'hexlet_code/tag_input'
  autoload :TagLabel, 'hexlet_code/tag_label'
  autoload :TagTextarea, 'hexlet_code/tag_textarea'

  def self.form_for(entity, attributes = {})
    @entity = entity
    @inputs = []
    yield HexletCode if block_given?
    TagForm.build(@inputs.join, attributes)
  end

  def self.input(property, options = {})
    @inputs << TagLabel.build(property)
    raise NoMethodError unless @entity.members.include?(property)

    value = @entity.to_h.fetch(property, nil)
    attributes = options.except(:as)
    if options[:as].nil?
      @inputs << TagInput.build(property, value, attributes)
    elsif options[:as] == :text
      @inputs << TagTextarea.build(property, value, attributes)
    end
  end

  def self.submit(caption = 'Save')
    @inputs << TagInput.build(nil, caption, { type: 'submit' })
  end
end
