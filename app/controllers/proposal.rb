Tod::App.controllers :proposal do
  get :new do
    @proposal = Proposal.new
    render 'proposal/new'
  end

  get :list do
    @proposals = Proposal.all
    render 'proposal/list'
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
      flash[:success] = t('proposal.new.result.success')
      redirect 'proposal/list'
    else
      flash.now[:error] = t('proposal.new.result.error')
      render 'proposal/new'
    end
  end

  get :detail do
    proposal_id = params[:proposal_id]
    @proposal_detail = Proposal.get proposal_id
    @comments = Comment.all(:proposal_id => proposal_id)
    @comment = Comment.new
    render 'proposal/detail'
  end

  post :comment do
    puts(params[:comment])
    author = params[:comment][:author]
    body = params[:comment][:body]
    proposal_id = params[:comment][:proposal_id]

    @comment = Comment.create(
      author: author,
      body: body,
      proposal_id: proposal_id,
      date: Time.now
    )

    if @comment.save
      redirect 'proposal/detail?proposal_id=' + proposal_id.to_s
    else
      flash.now[:error] = 'No se ha podido enviar el comentario'
      render 'proposal/detail?proposal_id=' + proposal_id.to_s
    end
  end
end
