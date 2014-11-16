Tod::App.controllers :proposal do
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

    @proposal = Proposal.create(title: title, description: description, author: author, date: Time.now)

    if @proposal.save
      flash[:success] = 'Propuesta enviada correctamente'
      redirect '/'
    else
      flash.now[:error] = 'No se ha podido enviar la propuesta'
      render 'proposal/new'
    end
  end

  get :detail do
    @comments = Comment.all
    @comment = Comment.new
    render 'proposal/detail'    
  end

  post :comment do
    author = params[:comment][:author]
    body = params[:comment][:body]

    @comment = Comment.create(
      author: author,
      body: body,
      date: Time.now
    )

    if @comment.save
      redirect 'proposal/detail'
    else
      flash.now[:error] = 'No se ha podido enviar el comentario'
      render 'proposal/detail'
    end
  end
end
