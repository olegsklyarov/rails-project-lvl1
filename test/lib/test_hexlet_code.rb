# frozen_string_literal: true

require_relative "../test_helper"

class TestHexletCode < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_that_it_can_generate_empty_tag
    assert { HexletCode::Tag.build("div").eql? "<div></div>" }
  end
end
