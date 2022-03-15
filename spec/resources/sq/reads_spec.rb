require 'rails_helper'

RSpec.describe SqResource, type: :resource do
  describe 'serialization' do
    let!(:sq) { create(:sq) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(sq.id)
      expect(data.jsonapi_type).to eq('sqs')
    end
  end

  describe 'filtering' do
    let!(:sq1) { create(:sq) }
    let!(:sq2) { create(:sq) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: sq2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([sq2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:sq1) { create(:sq) }
      let!(:sq2) { create(:sq) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            sq1.id,
            sq2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            sq2.id,
            sq1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
