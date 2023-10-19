require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AWeber::Resources::Subscriber do
  include BaseObjects
  subject { aweber.account.lists[1].subscribers[50723026] }
  
  it { should respond_to :ad_tracking }
  it { should respond_to :email }
  it { should respond_to :http_etag }
  it { should respond_to :id }
  it { should respond_to :ip_address }
  it { should respond_to :is_verified }
  it { should respond_to :last_followup_sent_at }
  it { should respond_to :last_followup_sent_link }
  it { should respond_to :misc_notes }
  it { should respond_to :name }
  it { should respond_to :resource_type_link }
  it { should respond_to :self_link }
  it { should respond_to :status }
  it { should respond_to :subscribed_at }
  it { should respond_to :subscription_method }
  it { should respond_to :subscription_url }
  it { should respond_to :unsubscribed_at }
  it { should respond_to :verified_at }
 
  it 'should be the correct path' do
    expect(subject.path).to eq("/accounts/1/lists/1/subscribers/50723026")
  end

  it 'should have the correct writable attributes' do
    expect(subject.writable_attrs).to include :name
    expect(subject.writable_attrs).to include :misc_notes
    expect(subject.writable_attrs).to include :email
    expect(subject.writable_attrs).to include :status
    expect(subject.writable_attrs).to include :custom_fields
    expect(subject.writable_attrs).to include :ad_tracking
    expect(subject.writable_attrs).to include :last_followup_message_number_sent
  end

  it "should move lists" do
    list = "http://api.aweber.com/1.0/accounts/1/lists/987654"
    json = { "ws.op" => "move", "list_link" => list }

    aweber.account.lists[1550685].stub(:self_link).and_return(list)
    oauth.should_receive(:post).with(subject.self_link, json)
    subject.list = aweber.account.lists[1550685]
  end


  it "should move lists with followup" do
    list = "http://api.aweber.com/1.0/accounts/1/lists/987654"
    json = { "ws.op" => "move", "list_link" => list, "last_followup_message_number_sent" => 1}

    aweber.account.lists[1550685].stub(:self_link).and_return(list)
    oauth.should_receive(:post).with(subject.self_link, json)
    subject.move(aweber.account.lists[1550685], 1)
  end

  it "should update list when moving" do
    new_list     = aweber.account.lists[1550685]
    subject.list = new_list
    new_list.subscribers[subject.id].should == subject
  end
end
