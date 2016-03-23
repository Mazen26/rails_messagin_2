require 'rails_helper'

describe Mailboxer::Mailbox do

  before do
    @user1 = FactoryGirl.create(:user, name: 'Tarek', email:"newmail@y.c")
    @user2 = FactoryGirl.create(:user, name: 'Mazen', email:"newmail1@y.c")
    @receipt1 = @user1.send_message(@entity2,"Body","Subject")
    @receipt2 = @user2.reply_to_all(@receipt1,"Reply body 1")
    @message1 = @receipt1.notification
    @conversation = @message1.conversation
  end

  it 'sends a message' do
    sender.send_message(@user1, "My message", "hello there")
    expect(sender.mailbox.sentbox.first.subject).to eq 'hello there'
    expect(sender.mailbox.sentbox.first.message).to eq 'My message'
  end


  it "should return conversations between two entities" do
    assert @user1.mailbox.conversations_with(@user2)
    expect(@user1.mailbox.conversations_with(@user2)).to eq [@conversation]
  end



end
