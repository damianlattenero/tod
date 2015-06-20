require 'rspec'
require_relative '../../../app/models/audience'


RSpec.describe Audience do
  describe 'model' do
    it { should respond_to(:is_initial?) }
    it { should respond_to(:is_practicing?) }
    it { should respond_to(:is_advanced?) }
  end


end