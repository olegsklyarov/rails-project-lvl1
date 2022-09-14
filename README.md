# HexletCode

[![Ruby](https://github.com/olegsklyarov/rails-project-lvl1/actions/workflows/main.yml/badge.svg)](https://github.com/olegsklyarov/rails-project-lvl1/actions/workflows/main.yml)
[![hexlet-check](https://github.com/olegsklyarov/rails-project-lvl1/workflows/hexlet-check/badge.svg)](https://github.com/olegsklyarov/rails-project-lvl1/actions/workflows/hexlet-check.yml)

Simple form generator

## Install

Add to your Gemfile

```ruby
gem 'hexlet_code'
```

and run

```bash
$ bundle install
```

## Example

```ruby
Post = Struct.new(:title, :body, keyword_init: true)
post = Post.new title: 'First post', body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'

html = HexletCode.form_for post do |f|
  f.input :title, class: 'input-title'
  f.input :body, as: :text
  f.submit
end

puts html
```

### Result

```html
<form action="#" method="post">
  <label for="title">Title</label>
  <input class="input-title" name="title" type="text" value="First post" />
  <label for="body">Body</label>
  <textarea name="body" cols="20" rows="40">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</textarea>
  <input type="submit" value="Save" />
</form>
```