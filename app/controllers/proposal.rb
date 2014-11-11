Tod::App.controllers :proposal do
  DataMapper.setup(:default, 'sqlite::memory:')
  DataMapper.auto_upgrade!

  get :new do
    @proposal = Proposal.new
    render 'proposal/new'
  end

  post :create do
    title = params[:proposal][:title]
    description = params[:proposal][:description]
    author = params[:proposal][:author]

    validate_fields_size(title)
    validate_fields_size(description, 1)
    validate_fields_size(author)

    @proposal = Proposal.create(title: title, description: description, author: author)

    if @proposal.save
      flash[:success] = 'Propuesta enviada correctamente'
      redirect '/'
    else
      flash.now[:error] = 'No se ha podido enviar la propuesta'
      render 'proposal/new'
    end
  end
  
end
