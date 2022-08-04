# frozen_string_literal: true

require_relative "hexlet_code/version"

module HexletCode
  # Generate HTML tag
  class Tag
    def self.build(name)
      return "<#{name}>" if name.eql? "br"

      "<#{name}></#{name}>"
    end
  end
end
