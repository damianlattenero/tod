Tod::App.controllers :proposal do
  get :new do
    @proposal = Proposal.new
    render 'proposal/new'
  end

  get :list do
    @proposals = Proposal.reverse
    render 'proposal/list'
  end

  post :search do
    @proposals = Proposal.all(:title.like => "%#{params[:query]}%")
    render 'proposal/search'
  end

  post :create do
    title = params[:proposal][:title]
    description = params[:proposal][:description]
    author = params[:proposal][:author]

    @proposal = Proposal.create(
      title: title, 
      description: description, 
      author: author, 
      date: Time.now
    )

    if @proposal.save
      flash[:success] = t('proposal.new.result.success')
      redirect 'proposal/list'
    else
      notify_new_proposal_field_too_short(
        'proposal.new.form.author_tag', 3
      ) unless field_length_enough?(author)

      notify_new_proposal_field_too_short(
        'proposal.new.form.description_tag', 1
      ) unless field_length_enough?(description, 1)

      notify_new_proposal_field_too_short(
        'proposal.new.form.title_tag', 3
      ) unless field_length_enough?(title)

      render 'proposal/new'
    end
  end

  get :detail do
    proposal_id = params[:proposal_id]
    @proposal_detail = Proposal.get proposal_id
    @comments = Comment.all(:proposal_id => proposal_id).reverse
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
      flash[:success] = t('proposal.detail.comment_result.success')
    else
      flash[:danger] = 
        t('proposal.detail.comment_result.field_too_short',
          field: t('proposal.detail.form.comment_tag'),
          cant: 1
         ) unless field_length_enough?(body, 1)

      flash[:danger] = 
        t('proposal.detail.comment_result.field_too_short',
          field: t('proposal.detail.form.name_tag'),
          cant: 3
         ) unless field_length_enough?(author)
    end

    redirect_to 'proposal/detail?proposal_id=' + proposal_id.to_s
  end
end
