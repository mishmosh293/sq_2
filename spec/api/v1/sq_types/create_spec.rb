require 'rails_helper'

RSpec.describe "sq_types#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/sq_types", payload
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
          type: 'sq_types',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(SqTypeResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { SqType.count }.by(1)
    end
  end
end
