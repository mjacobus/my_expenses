# My Expenses

Basic expenses app. 

[![Rails Unit Tests](https://github.com/mjacobus/my_expenses/actions/workflows/rails-unit-tests.yml/badge.svg)](https://github.com/mjacobus/my_expenses/actions/workflows/rails-unit-tests.yml)
[![Rubocop](https://github.com/mjacobus/my_expenses/actions/workflows/rubocop.yml/badge.svg)](https://github.com/mjacobus/my_expenses/actions/workflows/rubocop.yml)
[![Maintainability](https://api.codeclimate.com/v1/badges/392a331902559dc7eee5/maintainability)](https://codeclimate.com/github/mjacobus/my_expenses/maintainability)
[![Coverage Status](https://coveralls.io/repos/github/mjacobus/my_expenses/badge.svg?branch=main)](https://coveralls.io/github/mjacobus/my_expenses?branch=main)
[![Brakeman Scan](https://github.com/mjacobus/my_expenses/actions/workflows/brakeman-analysis.yml/badge.svg)](https://github.com/mjacobus/my_expenses/actions/workflows/brakeman-analysis.yml)
[![CodeQL](https://github.com/mjacobus/my_expenses/actions/workflows/codeql-analysis.yml/badge.svg)](https://github.com/mjacobus/my_expenses/actions/workflows/codeql-analysis.yml)


## Usage

```
bundle install
yarn install
cp .env.example .env
docker-compose up
./bin/rails db:create
./bin/rails db:migrate
./bin/rails server
```

## Caveats

- We use packwerk
- We have [endpoints classes](https://github.com/mjacobus/my_expenses/blob/main/packs/api/README.md)
