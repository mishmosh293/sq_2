require "rails_helper"

RSpec.describe "sqs#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/sqs", params: params
  end

  describe "basic fetch" do
    let!(:sq1) { create(:sq) }
    let!(:sq2) { create(:sq) }

    it "works" do
      expect(SqResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["sqs"])
      expect(d.map(&:id)).to match_array([sq1.id, sq2.id])
    end
  end
end
