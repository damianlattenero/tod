require_relative '../../../app/models/comment'

describe Comment do
  describe 'model' do
    it { should respond_to( :id) }
    it { should respond_to( :author) }
    it { should respond_to( :body) }
    it { should respond_to( :date) }
  end

  describe 'initialize' do
    it 'should create a comment' do

      rigth_now = Time.now.to_date

      comment = Comment.new
      comment.author = 'Hachedeeme'
      comment.body = 'Body'
      comment.date = rigth_now

      expect(comment.author).to eq "Hachedeeme"
      expect(comment.body).to eq "Body"
      expect(comment.date).to eq rigth_now
    end
  end

end
