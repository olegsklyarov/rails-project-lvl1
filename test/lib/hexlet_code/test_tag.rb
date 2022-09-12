# frozen_string_literal: true

require_relative "../../test_helper"

class TestTag < Minitest::Test
  def test_that_it_can_generate_br
    assert { HexletCode::Tag.build("br").eql? "<br>" }
  end

  def test_that_it_can_generate_img
    assert { HexletCode::Tag.build("img", src: "path/to/image").eql? '<img src="path/to/image">' }
  end

  def test_that_it_can_generate_input
    assert { HexletCode::Tag.build("input", type: "submit", value: "Save").eql? '<input type="submit" value="Save">' }
  end

  def test_that_it_can_generate_label
    assert { HexletCode::Tag.build("label") { "Email" }.eql? "<label>Email</label>" }
  end

  def test_that_it_can_generate_label_with_attribute
    assert { HexletCode::Tag.build("label", for: "email") { "Email" }.eql? '<label for="email">Email</label>' }
  end

  def test_that_it_can_generate_div
    assert { HexletCode::Tag.build("div").eql? "<div></div>" }
  end
end
