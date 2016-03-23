require 'rails_helper'

describe Mailboxer::Message do

  before do
    @user_1 = FactoryGirl.create(:user)
    @user_2 = FactoryGirl.create(:user)
    @receipt1 = @user_1.send_message(@user_2,"Body","Subject")
    @message1 = @receipt1.notification
    @conversation = @message1.conversation
  end

  it "should have right recipients" do
  	expect(@receipt1.notification.recipients.count).to eq 2
  end


end
