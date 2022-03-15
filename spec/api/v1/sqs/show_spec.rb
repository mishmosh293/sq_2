require "rails_helper"

RSpec.describe "sqs#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/sqs/#{sq.id}", params: params
  end

  describe "basic fetch" do
    let!(:sq) { create(:sq) }

    it "works" do
      expect(SqResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("sqs")
      expect(d.id).to eq(sq.id)
    end
  end
end
