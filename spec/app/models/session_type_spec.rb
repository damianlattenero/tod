require_relative '../../../app/models/session'

RSpec.describe Session do
  describe 'model' do
    it { should respond_to( :is_presentation?) }
    it { should respond_to( :is_workshop?) }
    it { should respond_to( :is_empty?) }
  end

  describe 'initialize' do
    it 'should is_presentation if initialized with :presentation' do
      expect(Session.new(:presentation).is_presentation?).to eq true
    end
  end
end