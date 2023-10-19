require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AWeber::Resources::CustomField do
  include BaseObjects
  subject { aweber.account.lists[1].custom_fields[1] }
  
  it 'should be the correct path' do
    expect(subject.path).to eq("/accounts/1/lists/1/custom_fields/1")
  end

  it { should respond_to :name }
  it { should respond_to :is_subscriber_updateable }
  it { should respond_to :is_subscriber_updateable? }
end
