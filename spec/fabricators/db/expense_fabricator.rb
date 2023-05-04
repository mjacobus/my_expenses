# frozen_string_literal: true

Fabricator(:expense, from: 'Db::Expense') do
  description 'MyString'
  amount      1
  expensed_at '2023-05-04 09:03:32'
  user
end