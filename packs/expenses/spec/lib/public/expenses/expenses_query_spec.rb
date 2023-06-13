# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Expenses::ExpensesQuery do
  subject(:query) { described_class.new }

  describe 'mutators' do
    let(:mutated) do
      query.with_owner_id('owner-id')
        .with_label_ids(['label-id'])
        .without_label_ids(['no-label-id'])
        .with_from_date('from-date')
        .with_to_date('to-date')
    end

    it 'freezes the object' do
      expect(mutated).to be_frozen
    end

    it 'returns a new object with the new values' do
      expect(mutated).not_to be(query)
      expect(query.owner_id).to be_nil
    end

    it 'has a owner_id mutator' do
      expect(mutated.owner_id).to eq('owner-id')
    end

    it 'mutates label_ids' do
      expect(mutated.label_ids).to eq(['label-id'])
    end

    it 'mutates not_label_ids' do
      expect(mutated.not_label_ids).to eq(['no-label-id'])
    end

    it 'mutates from_date' do
      expect(mutated.from_date).to eq('from-date')
    end

    it 'mutates to_date' do
      expect(mutated.to_date).to eq('to-date')
    end
  end

  describe 'with_limit' do
    it 'maxes to max limit' do
      mutated = query.with_limit(1000)

      expect(mutated.limit).to eq(100)
    end

    it 'has a minimun of one' do
      mutated = query.with_limit(1)

      expect(mutated.limit).to eq(1)
    end

    it 'coerces value' do
      mutated = query.with_limit('2-and-three')

      expect(mutated.limit).to eq(2)
    end

    it 'uses default if number does not make any sence' do
      mutated = query.with_limit('nonsense')

      expect(mutated.limit).to eq(100)
    end
  end

  describe 'with_page' do
    it 'has a minimun of one' do
      mutated = query.with_page(0)

      expect(mutated.page).to eq(1)
    end

    it 'can be any positive number' do
      mutated = query.with_page(10)

      expect(mutated.page).to eq(10)
    end
  end

  describe 'offset' do
    it 'is zero if page is one' do
      mutated = query.with_page(1)

      expect(mutated.offset).to eq(0)
    end

    it 'returns 100 when limit is 100 and page is 2' do
      mutated = query.with_page(2)

      expect(mutated.offset).to eq(100)
    end

    it 'returns 200 when limit is 100 and page is 3' do
      mutated = query.with_page(3)

      expect(mutated.offset).to eq(200)
    end

    it 'returns 50 when limit is 50 and page is 2' do
      mutated = query.with_page(2).with_limit(50)

      expect(mutated.offset).to eq(50)
    end
  end
end
