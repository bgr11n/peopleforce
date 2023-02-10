# Peopleforce

Ruby version `3.2.1`

Rails version `7.0.4.2`

## Project startup

- Pre-installed docker
- Enter bash inside docker:
	```bash
	docker-compose run app bash
	```
- Inside docker, install gems:
	```bash
	bundle install
	```
- Inside docker, setup dev/test database:
	```bash
	bundle exec rake db:setup
	```
- To start server:
	```bash
	docker-compose up --force-recreate app
	```
- Project will be available at `http://localhost:3300`

## Running specs

- Inside docker container, prepare DB:
	```bash
	RAILS_ENV=test rake db:create
	RAILS_ENV=test rake db:schema:load

	bundle exec rspec
	```

## Assumptions during development
- Added only users#update action as was required by test task;
- Consider using CSRF protection or API keys (not relevant for test task purpose);
- Consider using policies for authorization (ex. [pundit](https://github.com/varvet/pundit));
- Also possible to store fields values not in jsonb field but in separate table.

### TODOs
- Add schema annotations (ex. [the_schema_is](https://github.com/zverok/the_schema_is), [annotate](https://github.com/ctran/annotate_models));
- Add module tests (for test task purpose was omitted because requests tests covers all introduced logic);
- Consider using lib for business logic (ex. [traiblazer-operation](https://github.com/trailblazer/trailblazer-operation)).
