Tod::App.controllers :proposal do

  get :new do
    # @proposal = Proposal.new
    render 'proposal/new'
  end

  post :create do
=begin
    //TODO - Important to add validations from model here
    title = params[:proposal][:title]
    description = "asdasd"
    author = "asdasd"

    proposal = Proposal.create(title: title, description: description, author: author)
    proposal.save
=end
  end
  
end
