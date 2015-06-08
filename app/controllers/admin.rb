Tod::App.controllers :admin do
  get :roles, :map => '/roles' do
  	@users = User.reverse
    render 'admin/roles'
  end
end
