# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::Expenses::IndexEndpoint, type: :endpoint do
  let(:finder) { instance_double(Expenses::ExpensesFinder) }
  let(:finder_result) { instance_double(Expenses::ExpensesFinder::Result) }

  before do
    allow(user).to receive(:id).and_return('user-id')
    endpoint_args[:finder] = finder

    allow(finder).to receive(:by_query).and_return(finder_result)
  end

  it 'returns a response' do
    expected = Api::Expenses::IndexResponse.new(finder_result: finder_result)

    expect(response).to be_equal_to(expected)
  end

  it 'calls the finder with the correct query' do # rubocop:disable RSpec/ExampleLength
    allow(request).to receive(:params).and_return(
      {
        from: 'the-from',
        to: 'the-to',
        limit: 100,
        page: 2
      }
    )

    expected_query = Expenses::ExpensesQuery.new
      .with_owner_id('user-id')
      .with_from_date('the-from')
      .with_to_date('the-to')
      .with_limit(100)
      .with_page(2)

    response

    expect(finder).to have_received(:by_query) do |query|
      expect(query).to be_equal_to(expected_query)
    end
  end
end
