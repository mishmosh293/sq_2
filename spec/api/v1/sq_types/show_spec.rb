require 'rails_helper'

RSpec.describe "sq_types#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/sq_types/#{sq_type.id}", params: params
  end

  describe 'basic fetch' do
    let!(:sq_type) { create(:sq_type) }

    it 'works' do
      expect(SqTypeResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('sq_types')
      expect(d.id).to eq(sq_type.id)
    end
  end
end
