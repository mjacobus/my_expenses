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
end
