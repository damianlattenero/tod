# Helper methods defined here can be accessed in any controller or view in the application

module Tod
  class App
    module AuthHelper

      def logged_user_admin?
        session[:user].is_admin?
      end

      def set_admin_role
        session[:user].set_admin
      end
    end
    helpers AuthHelper
  end
end