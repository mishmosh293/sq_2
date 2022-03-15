require "rails_helper"

RSpec.describe "sqs#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/sqs/#{sq.id}"
  end

  describe "basic destroy" do
    let!(:sq) { create(:sq) }

    it "updates the resource" do
      expect(SqResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Sq.count }.by(-1)
      expect { sq.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
