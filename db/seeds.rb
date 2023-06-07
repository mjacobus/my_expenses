# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

def log(message)
  Rails.logger.debug message
  yield
  Rails.logger.debug 'Done'
end

user = Db::User.first || Fabricate(:user)

log('Creating expenses') do
  20.times do
    Fabricate(:expense, user: user)
  end
end
