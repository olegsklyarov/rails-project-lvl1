# frozen_string_literal: true

require_relative '../test_helper'

class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, :gender, keyword_init: true)

  def setup
    @user = User.new name: 'rob', job: 'hexlet', gender: 'm'
  end

  def test_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_form
    form_html = HexletCode.form_for @user
    assert { form_html.eql? load_html_fixture('form') }
  end

  def test_form_with_url
    form_html = HexletCode.form_for @user, url: '/users'
    assert { form_html.eql? load_html_fixture('form_with_url') }
  end

  def test_form_elements
    form_html = HexletCode.form_for @user, url: '/users' do |f|
      f.input :name, class: 'user-input'
      f.input :job, as: :text
    end
    assert { form_html.eql? load_html_fixture('form_elements') }
  end

  def test_submit
    user = User.new job: 'hexlet'
    form_html = HexletCode.form_for user do |f|
      f.input :name
      f.input :job
      f.submit
    end
    assert { form_html.eql? load_html_fixture('submit') }
  end

  def test_submit_with_value
    user = User.new job: 'hexlet'
    form_html = HexletCode.form_for user, url: '#' do |f|
      f.input :name
      f.input :job
      f.submit 'Wow'
    end
    assert { form_html.eql? load_html_fixture('submit_with_value') }
  end

  def test_unknown_property
    assert_raises NoMethodError do
      HexletCode.form_for User.new, url: '#' do |f|
        f.input :company
      end
    end
  end
end
