require 'rails_helper'

describe Mailboxer::Conversation do

  let!(:user_1)  { FactoryGirl.create(:user) }
  let!(:user_2)  { FactoryGirl.create(:user) }
  let!(:receipt1) { user_1.send_message(user_2,"Body","Subject") }
  let!(:receipt2) { user_2.reply_to_all(receipt1,"Reply body 1") }
  let!(:receipt3) { user_1.reply_to_all(receipt2,"Reply body 2") }
  let!(:receipt4) { user_2.reply_to_all(receipt3,"Reply body 3") }
  let!(:message1) { receipt1.notification }
  let!(:message4) { receipt4.notification }
  let!(:conversation) { message1.conversation }

  it { should validate_presence_of :subject }


  it "should have proper original message" do
    expect(conversation.original_message).to eq message1
  end

  it "should have proper originator (first sender)" do
    expect(conversation.originator).to eq user_1
  end

  it "should have proper last message" do
    expect(conversation.last_message).to eq message4
  end

  it "should have proper last sender" do
    expect(conversation.last_sender).to eq user_2
  end


end
