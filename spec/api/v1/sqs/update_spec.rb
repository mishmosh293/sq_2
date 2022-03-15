require 'rails_helper'

RSpec.describe "sqs#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/sqs/#{sq.id}", payload
  end

  describe 'basic update' do
    let!(:sq) { create(:sq) }

    let(:payload) do
      {
        data: {
          id: sq.id.to_s,
          type: 'sqs',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(SqResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { sq.reload.attributes }
    end
  end
end
