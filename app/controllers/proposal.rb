require 'iconv'

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
    @proposals = search("#{params[:query]}").uniq
    render 'proposal/search'
  end

  post :create do
    title       = params[:proposal][:title]
    description = params[:proposal][:description]
    author      = params[:proposal][:author]

    @proposal             = Proposal.new
    @proposal.title       = title
    @proposal.description = description
    @proposal.author      = author
    @proposal.date        = Time.now
    @proposal.tag_list    = params[:proposal][:tags_list].downcase

    if Proposal.first(:title => title)
      @proposal.append_author_to_title
    end

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
    proposal_id      = params[:proposal_id]
    @proposal_detail = Proposal.get proposal_id
    @comments        = Comment.all(:proposal_id => proposal_id).reverse
    @comment         = Comment.new
    @evaluation      = Evaluation.new
    render 'proposal/detail'
  end

  post :comment do
    author        = params[:comment][:author]
    body          = params[:comment][:body]
    proposal_id   = params[:comment][:proposal_id]

    @comment      = Comment.new params[:comment]
    @comment.date = Time.now

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

  post :evaluate do
    opinion     = params[:evaluation][:opinion]
    body        = params[:evaluation][:evaluation_body]
    proposal_id = params[:evaluation][:proposal_id]

    @evaluation = Evaluation.new
    @evaluation.evaluator   = session[:user].name
    @evaluation.opinion     = opinion
    @evaluation.comment     = body
    @evaluation.proposal_id = proposal_id

    if @evaluation.save
      flash[:success] = t('proposal.evaluation.form.results.success', opinion: opinion)
    else
      flash[:danger] =
        t('proposal.evaluation.form.results.words_enough',
          field: t('proposal.evaluation.form.comment_tag'),
          cant: 3
         ) unless words_enough?(body, 3)
    end

    redirect_to 'proposal/detail?proposal_id=' + proposal_id.to_s
  end

  get :evaluations do
    proposal_id      = params[:proposal_id]
    logger.debug "PROPOSAL EVALUATIONS FOR #{ params[:proposal_id]}"
    @proposal_detail = Proposal.get proposal_id
    @evaluations     = Evaluation.all(:proposal_id => proposal_id).reverse

    render 'proposal/evaluations'
  end
end
