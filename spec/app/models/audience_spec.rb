require 'rspec'
require_relative '../../../app/models/audience'


RSpec.describe Audience do
  describe 'model' do
    it { should respond_to(:is_initial?) }
    it { should respond_to(:is_practicing?) }
    it { should respond_to(:is_advanced?) }
  end

  describe 'initialize' do
    it 'should is_initial if initialized with :initial' do
      expect(Audience.new(:initial).is_initial?).to eq true
    end

    it 'should not be initial if initialized with :practicing' do
      expect(Audience.new(:practicing).is_initial?).to eq false
    end

  end

end