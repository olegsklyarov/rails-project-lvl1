# frozen_string_literal: true

module HexletCode
  class TagForm
    def self.build(body, attributes = {})
      attributes[:action] = attributes[:url] || '#'
      attributes[:method] ||= 'post'

      Tag.build('form', attributes.except(:url)) { body }
    end
  end
end
