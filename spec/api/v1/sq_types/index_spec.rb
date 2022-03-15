require "rails_helper"

RSpec.describe "sq_types#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/sq_types", params: params
  end

  describe "basic fetch" do
    let!(:sq_type1) { create(:sq_type) }
    let!(:sq_type2) { create(:sq_type) }

    it "works" do
      expect(SqTypeResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["sq_types"])
      expect(d.map(&:id)).to match_array([sq_type1.id, sq_type2.id])
    end
  end
end
