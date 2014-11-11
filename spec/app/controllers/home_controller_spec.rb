require 'spec_helper'

RSpec.describe "/home" do
  pending 'default' do
    before do
      get "/home"
    end

    it "should return" do
      expect(last_response.body).to eq "Hello World"
    end
  end
end
