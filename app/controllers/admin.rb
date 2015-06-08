Tod::App.controllers :admin do
  get :roles, :map => '/roles' do
  	@users = User.reverse
    render 'admin/roles'
  end

  get :remove_role, :params => [ :uid ] do
    logger.debug "ACTION: REMOVE REVISOR ROLE FOR #{params[:uid]}"
    User.find_uid(params[:uid]).update(:role => Role.new(:user))
  end

  get :asign_role, :params => [ :uid ] do
    logger.debug "ACTION: ADD REVISOR ROLE FOR #{params[:uid]}"
    User.find_uid(params[:uid]).update(:role => Role.new(:revisor))
  end
end
