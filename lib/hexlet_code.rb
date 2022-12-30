# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload :Render, 'hexlet_code/render'
  autoload :Form, 'hexlet_code/form'
  autoload :Tag, 'hexlet_code/tag'
  autoload :Input, 'hexlet_code/tags/input'
  autoload :Text, 'hexlet_code/tags/text'

  def self.form_for(entity, attributes = {})
    render = Render.new entity, attributes
    yield render if block_given?
    render.render
  end
end
