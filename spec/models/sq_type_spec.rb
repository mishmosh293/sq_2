require "rails_helper"

RSpec.describe SqType, type: :model do
  describe "Direct Associations" do
    it { should have_many(:sqs) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
