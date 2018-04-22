# README

## Configuration

Add config/env.yml file with environment variables (gmail is used for sending emails):

- GMAIL_USERNAME
- GMAIL_PASSWORD
- DB_DATABASE_DEV
- DB_DATABASE_TEST
- DB_USERNAME
- DB_PASSWORD
- DB_PORT

Create database:

```
rake db:create
rake db:migrate
rake db:seed
```

## Test

```
rake db:test:prepare
rspec
```