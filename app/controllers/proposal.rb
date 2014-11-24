Tod::App.controllers :proposal do
  get :new do
    @proposal = Proposal.new
    #@tag = Tag.new
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
    tags = params[:proposal][:tags_list]

    @proposal = Proposal.new
    @proposal.title = title
    @proposal.description = description
    @proposal.author = author
    @proposal.date = Time.now
    @proposal.tag_list = tags.downcase

    if @proposal.save
      # @proposal.tag!(params[:proposal][:tags])
      flash[:success] = t('proposal.new.result.success')
      redirect 'proposal/list'
    else
      # flash.now[:error] = t('proposal.new.result.error')
      flash.now[:error] = t('proposal.new.result.field_too_short', field: t('proposal.new.form.author_tag'), cant: '3') unless field_length_enough?(author)
      flash.now[:error] = t('proposal.new.result.field_too_short', field: t('proposal.new.form.description_tag'), cant: '1') unless field_length_enough?(description, 1)
      flash.now[:error] = t('proposal.new.result.field_too_short', field: t('proposal.new.form.title_tag'), cant: '3') unless field_length_enough?(title)
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
      flash[:success] = t('proposal.detail.comment_result.success')
      redirect 'proposal/detail?proposal_id=' + proposal_id.to_s
    else
      flash[:error] = t('proposal.detail.comment_result.field_too_short', field: t('proposal.detail.form.name_tag'), cant: '3') unless field_length_enough?(author)
      flash[:error] = t('proposal.detail.comment_result.field_too_short', field: t('proposal.detail.form.comment_tag'), cant: '1') unless field_length_enough?(body, 1)
      redirect_to 'proposal/detail?proposal_id=' + proposal_id.to_s
    end
    
  end
end
