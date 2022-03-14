require 'rails_helper'

RSpec.describe Sq, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:sqtype) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
