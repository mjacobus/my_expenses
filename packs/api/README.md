Expenses
--------

Lean controller:

```ruby
class Api::SessionsController < Api::Controller
  def show
    respond_with_endpoint(
      Api::Sessions::ShowEndpoint.new(actor: current_user)
    )
  end
end
```


Lean controller test:

```ruby
require 'rails_helper'

RSpec.describe Api::SessionsController do
  describe 'GET /index' do
    before do
      sign_in(user)
      stub_endpoint(Api::Sessions::ShowEndpoint)
    end

    it 'responds with the correct endpoint' do
      get '/api/session'

      expect(response).to be_successful
      expect(response.body).to eq('ok')
    end

    it 'instantiates endpoint with the correct arguments' do
      get '/api/session'

      expect(Api::Sessions::ShowEndpoint).to have_received(:new).with(actor: user)
    end
  end
end
```

Lean Endpoint

```ruby
module Api
  module Sessions
    class ShowEndpoint < Endpoint
      def create_response(request:) # rubocop:disable Lint/UnusedMethodArgument
        data = {
          name: actor.name,
          email: actor.email,
          avatar: actor.avatar
        }
        JsonResponse.new(data)
      end
    end
  end
end
```

Unit testing endpoint


```ruby
RSpec.describe Api::Sessions::ShowEndpoint, type: :endpoint do
  describe '#create_response' do
    it 'responds correctly' do
      expect(response.data).to eq(
        name: user.name,
        email: user.email,
        avatar: user.avatar
      )
    end
  end
end
```
