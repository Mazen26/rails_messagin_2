require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'DB table' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :name }
    it { is_expected.to have_db_column :email }
    it { is_expected.to have_db_column :encrypted_password }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(10) }
    it { is_expected.to validate_presence_of(:email) }

  end

  describe 'mailbox' do

    let(:sender) {FactoryGirl.create(:user, name: 'Thomas')}
    let(:user_1) {FactoryGirl.create(:user, name: 'Mazen')}
    let(:user_2) {FactoryGirl.create(:user, name: 'Tarek')}

    it { is_expected.to respond_to(:mailbox) }

    it 'sends a message' do
      sender.send_message(user_1, "My message", "hello there")
      # expect(sender.mailbox.sentbox.first.subject).to eq 'hello there'
      # expect(sender.mailbox.sentbox.first.message).to eq 'My message'
    end

  end

  describe 'Fixtures' do
    it 'should have valid Factory' do
      expect(FactoryGirl.create(:user)).to be_valid
    end
  end
end
