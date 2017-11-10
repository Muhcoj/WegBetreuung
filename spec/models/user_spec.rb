require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'creation' do
    before do
      @user = FactoryBot.create(:user)
    end

    it 'should be able to be created if valid' do
      expect(@user).to be_valid
    end

    describe 'validations' do 
      it 'should not be valid without a first name' do
        @user.first_name = nil
        expect(@user).to_not be_valid
      end

      it 'should not be valid without a last name' do
        @user.last_name = nil
        expect(@user).to_not be_valid
      end
    end

    describe 'custom name methods' do
      it 'has a full name method that combines first and last name' do
        expect(@user.full_name).to eq("Johnson, Don")
      end
    end
  end
end
