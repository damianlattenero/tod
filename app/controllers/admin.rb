Tod::App.controllers :admin do
  get :roles, :map => '/roles' do with_admin_role{
      @users = User.all(:role.not => "admin" )
      render 'admin/roles'
    }
  end

  get :roles, :map => '/conference' do with_admin_role{
    render 'admin/conference'
  }
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
