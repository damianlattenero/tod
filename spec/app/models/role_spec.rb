require_relative '../../../app/models/role'

RSpec.describe Role do
  describe 'model' do
    it { should respond_to( :is_user?) }
    it { should respond_to( :is_revisor?) }
  end

  describe 'initialize' do
    it 'should have default role set to user' do
      expect(Role.new.is_user?).to eq true
    end

    it 'should is_user if initialized with :user' do
      expect(Role.new(:user).is_user?).to eq true
    end


    it 'should is_revisor if initialized with :revisor' do
      expect(Role.new(:revisor).is_revisor?).to eq true
    end

    it 'should not be revisor if initialized with :user' do
      expect(Role.new(:user).is_revisor?).to eq false
    end
  end

end