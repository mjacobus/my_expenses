# frozen_string_literal: true

Fabricator(:expense, from: 'Db::Expense') do
  description { Faker::Commerce.product_name }
  amount      { Faker::Commerce.price * 100 }
  expensed_at { Faker::Date.between(from: 20.days.ago, to: Time.zone.today) }
  user
end
