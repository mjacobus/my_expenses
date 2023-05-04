# frozen_string_literal: true

class Db::Expense < ApplicationRecord
  belongs_to :user
end
