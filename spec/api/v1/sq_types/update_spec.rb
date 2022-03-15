require 'rails_helper'

RSpec.describe "sq_types#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/sq_types/#{sq_type.id}", payload
  end

  describe 'basic update' do
    let!(:sq_type) { create(:sq_type) }

    let(:payload) do
      {
        data: {
          id: sq_type.id.to_s,
          type: 'sq_types',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(SqTypeResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { sq_type.reload.attributes }
    end
  end
end
