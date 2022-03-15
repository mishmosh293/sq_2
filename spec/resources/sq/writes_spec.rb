require 'rails_helper'

RSpec.describe SqResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'sqs',
          attributes: { }
        }
      }
    end

    let(:instance) do
      SqResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Sq.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:sq) { create(:sq) }

    let(:payload) do
      {
        data: {
          id: sq.id.to_s,
          type: 'sqs',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      SqResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { sq.reload.updated_at }
      # .and change { sq.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:sq) { create(:sq) }

    let(:instance) do
      SqResource.find(id: sq.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Sq.count }.by(-1)
    end
  end
end
