require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AWeber::Resources::WebForm do
  include BaseObjects
  subject { aweber.account.lists[1].web_forms[1911952229] }

  it 'should be the correct path' do 
    expect(subject.path).to eq("/accounts/1/lists/1/web_forms/1911952229")
  end
  
  it { should respond_to :conversion_percentage }
  it { should respond_to :http_etag }
  it { should respond_to :id }
  it { should respond_to :is_active }
  it { should respond_to :name }
  it { should respond_to :resource_type_link }
  it { should respond_to :self_link }
  it { should respond_to :total_displays }
  it { should respond_to :total_submissions }
  it { should respond_to :total_unique_displays }
  it { should respond_to :type }
  it { should respond_to :unique_conversion_percentage }
  it { should respond_to :html_source_link }
  it { should respond_to :javascript_source_link }

end
