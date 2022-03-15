require 'rails_helper'

RSpec.describe "sqs#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/sqs", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'sqs',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(SqResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Sq.count }.by(1)
    end
  end
end
