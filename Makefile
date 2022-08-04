install:
	bundle install

rake:
	bundle exec rake

lint:
	bundle exec rubocop

lint-fix:
	bundle exec rubocop -A
