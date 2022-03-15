require "rails_helper"

RSpec.describe "sq_types#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/sq_types/#{sq_type.id}"
  end

  describe "basic destroy" do
    let!(:sq_type) { create(:sq_type) }

    it "updates the resource" do
      expect(SqTypeResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { SqType.count }.by(-1)
      expect { sq_type.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
