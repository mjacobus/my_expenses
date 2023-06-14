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

log('Resetting expenses') do
  Db::Expense.where(user: user).delete_all
  minutes = 0

  223.times do
    minutes += rand(1...1000)
    time = minutes.minutes.ago
    Fabricate(:expense, user: user, expensed_at: time, created_at: time, updated_at: time)
  end
end
