require 'spec_helper'
require 'pry'

describe 'CTS v1 API' do
  let(:api_host) { 'http://cts.api.strasbourg-data.fr' }

  before(:each) do
    Cts::Stop.any_instance.stub(:next_arrivals) { [] }
    Cts::Stop.any_instance.stub(:timesheets) { [] }
  end

  describe 'stops' do
    describe 'list stops' do
      let!(:stops) { FactoryGirl.create_list(:cts_stop, 10) }
      let!(:request) { get "#{api_host}/stops" }

      subject { last_response }

      its(:status) { should eq 200 }
      its(:body) { should have_json_path '0/code' }
      its(:body) { should have_json_path '0/name' }
    end
    describe 'show a stop' do
      let(:stop) { FactoryGirl.create :cts_stop, code: 311 }
      let!(:request) { get "#{api_host}/stops/#{stop.to_param}" }

      subject { last_response }

      its(:status) { should eq 200 }
      its(:body) { should have_json_path 'code' }
      its(:body) { should have_json_path 'name' }
      its(:body) { should have_json_path 'next_arrivals' }
      its(:body) { should have_json_path 'timesheets' }
    end
  end
end
