require "rails_helper"

RSpec.describe SqTypeResource, type: :resource do
  describe "serialization" do
    let!(:sq_type) { create(:sq_type) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(sq_type.id)
      expect(data.jsonapi_type).to eq("sq_types")
    end
  end

  describe "filtering" do
    let!(:sq_type1) { create(:sq_type) }
    let!(:sq_type2) { create(:sq_type) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: sq_type2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([sq_type2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:sq_type1) { create(:sq_type) }
      let!(:sq_type2) { create(:sq_type) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      sq_type1.id,
                                      sq_type2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      sq_type2.id,
                                      sq_type1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
