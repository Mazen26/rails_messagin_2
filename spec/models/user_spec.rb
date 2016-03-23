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
      sender.send_message(user_1, 'My message', 'hello there')
      expect(sender.mailbox.sentbox.first.subject).to eq 'hello there'
      expect(sender.mailbox.sentbox.count).to eq 1
      expect(user_1.mailbox.inbox.first.subject).to eq 'hello there'
      expect(user_2.mailbox.inbox.count).to eq 0

    end

    it 'reply to sender' do
      receipt = sender.send_message(user_1, 'My message', 'hello there')
      assert user_1.reply_to_sender(receipt, 'Reply My message')
      expect(user_1.mailbox.sentbox.count).to eq 1
      expect(sender.mailbox.inbox.first.subject).to eq 'hello there'
    end

    it 'reply to all' do
      receipt = sender.send_message([user_2,user_1], 'My message', 'hello there')
      assert user_2.reply_to_all(receipt,'Reply My message')
      expect(sender.mailbox.inbox.first.subject).to eq 'hello there'
      expect(user_1.mailbox.inbox.first.subject).to eq 'hello there'
    end

    it 'mark as read' do
      receipt = sender.send_message(user_1, 'My message', 'hello there')
      expect(receipt.is_read).to eq true
    end

    it 'delete a message' do
      receipt = sender.send_message(user_1, 'My message', 'hello there')
      sender.trash(receipt)
      expect(receipt.trashed).to eq true
    end

    it 'Un delete a message'do
    receipt = sender.send_message(user_1, 'My message', 'hello there')
    expect(receipt.trashed).to eq false
    sender.trash(receipt)
    sender.untrash(receipt)
    expect(receipt.trashed).to eq false
    end

    it ' Return conversation between 2 users ' do
      receipt_1 = user_1.send_message(user_2, 'My message', 'hello there')
      receipt_2 = user_2.reply_to_all(receipt_1,'Reply My message')
      message = receipt_1.notification
      conversation = message.conversation

    end
  end


  describe 'Fixtures' do
    it 'should have valid Factory' do
      expect(FactoryGirl.create(:user)).to be_valid
    end
  end
end
