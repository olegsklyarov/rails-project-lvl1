# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'hexlet_code'

require 'minitest/autorun'
require 'minitest/power_assert'
require 'webmock/minitest'

def load_fixture(filename)
  File.read(File.dirname(__FILE__) + "/fixture/#{filename}")
end

def load_html_fixture(filename)
  load_fixture(filename).strip.gsub(/>\s+</, '><')
end
