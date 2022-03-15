require "rails_helper"

RSpec.describe SqTypeResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "sq_types",
          attributes: {},
        },
      }
    end

    let(:instance) do
      SqTypeResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { SqType.count }.by(1)
    end
  end

  describe "updating" do
    let!(:sq_type) { create(:sq_type) }

    let(:payload) do
      {
        data: {
          id: sq_type.id.to_s,
          type: "sq_types",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      SqTypeResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { sq_type.reload.updated_at }
      # .and change { sq_type.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:sq_type) { create(:sq_type) }

    let(:instance) do
      SqTypeResource.find(id: sq_type.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { SqType.count }.by(-1)
    end
  end
end
