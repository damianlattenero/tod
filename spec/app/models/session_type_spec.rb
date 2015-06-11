require_relative '../../../app/models/session'

RSpec.describe Session do

  describe 'model' do
    it { should respond_to( :is_presentation?) }
    it { should respond_to( :is_workshop?) }
    it { should respond_to( :is_empty?) }
  end

end