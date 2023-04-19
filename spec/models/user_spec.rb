require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user){FactoryBot.create(:user)}

  describe 'validations' do

    it 'has a valid factory' do
      expect(user).to be_valid
    end

    it { should validate_presence_of(:email) }
    it { should allow_value('user@example.com').for(:email) }
    it { should_not allow_value('not_an_email').for(:email) }

  end
end