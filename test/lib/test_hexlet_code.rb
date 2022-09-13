# frozen_string_literal: true

require_relative '../test_helper'

class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, :gender, keyword_init: true)

  def setup
    @user = User.new name: 'rob', job: 'hexlet', gender: 'm'
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_that_it_can_generate_form
    form_html = HexletCode.form_for @user do |f|
    end
    assert { form_html.eql? '<form action="#" method="post"></form>' }
  end

  def test_that_it_can_generate_form_with_url
    form_html = HexletCode.form_for @user, url: '/users' do |f|
    end
    assert { form_html.eql? '<form action="/users" method="post"></form>' }
  end

  def test_that_it_can_generate_form_elements
    form_html = HexletCode.form_for @user do |f|
      f.input :name
      f.input :job, as: :text
    end
    assert { form_html.eql? load_html_fixture('form_with_elements.html') }
  end

  def test_that_it_can_generate_submit
    user = User.new job: 'hexlet'
    form_html = HexletCode.form_for user do |f|
      f.input :name
      f.input :job
      f.submit
    end
    assert { form_html.eql? load_html_fixture('06-form-submit.html') }
  end

  def test_that_it_can_generate_submit_with_value
    user = User.new job: 'hexlet'
    form_html = HexletCode.form_for user, url: '#' do |f|
      f.input :name
      f.input :job
      f.submit 'Wow'
    end
    assert { form_html.eql? load_html_fixture('06-form-submit-value.html') }
  end

  def test_that_it_can_generate_input_with_class
    user = User.new
    form_html = HexletCode.form_for user, url: '#' do |f|
      f.input :name, class: 'user-input'
    end
    assert { form_html.eql? load_html_fixture('06-form-input-with-class.html') }
  end
end
