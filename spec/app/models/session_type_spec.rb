require_relative '../../../app/models/type'

RSpec.describe Type do
  describe 'model' do
    it { should respond_to(:is_presentation?) }
    it { should respond_to(:is_workshop?) }
  end

  describe 'initialize' do
    it 'should is_presentation if initialized with :presentation' do
      expect(Type.new(:presentation).is_presentation?).to eq true
    end

    it 'should is_workshop if initialized with :workshop' do
      expect(Type.new(:workshop).is_workshop?).to eq true
    end

    it 'should not be presentation if initialized with :workshop' do
      expect(Type.new(:workshop).is_presentation?).to eq false
    end

    it 'should not be workshop if initialized with :presentation' do
      expect(Type.new(:presentation).is_workshop?).to eq false
    end
  end
end