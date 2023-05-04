# frozen_string_literal: true

class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.string :description
      t.integer :amount
      t.datetime :expensed_at
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
