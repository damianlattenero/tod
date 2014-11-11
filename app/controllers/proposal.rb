Tod::App.controllers :proposal do

  get :new do
    @proposal = Proposal.new
    render 'proposal/new'
  end

  post :create do
    title = validate_fields_size(params[:proposal][:title])
    description = validate_fields_size(params[:proposal][:description], 1)
    author = validate_fields_size(params[:proposal][:author])

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
