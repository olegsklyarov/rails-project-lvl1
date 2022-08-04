# frozen_string_literal: true

require_relative "../test_helper"

class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, keyword_init: true)

  def setup
    @user = User.new name: "Rob"
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

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

  def test_that_it_can_generate_form
    form_html = HexletCode.form_for @user do |f|
    end
    assert { form_html.eql? "<form action=\"#\" method=\"post\">\n</form>" }
  end

  def test_that_it_can_generate_form_with_url
    form_html = HexletCode.form_for @user, url: "/users" do |f|
    end
    assert { form_html.eql? "<form action=\"/users\" method=\"post\">\n</form>" }
  end
end
