require_relative '../../../app/models/evaluation'

describe Evaluation do
  describe 'model' do
    it { should respond_to( :id) }
    it { should respond_to( :evaluator) }
    it { should respond_to( :comment) }
  end

  describe 'initialize' do
    it 'should create a evaluation' do

      comment = Evaluation.new
      comment.evaluator = 'Hachedeeme'
      comment.comment = 'Body'

      expect(comment.evaluator).to eq "Hachedeeme"
      expect(comment.comment).to eq "Body"
    end
  end

end
