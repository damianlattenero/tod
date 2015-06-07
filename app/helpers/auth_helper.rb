# Helper methods defined here can be accessed in any controller or view in the application

module Tod
  class App
    module AuthHelper

      def with_role(*roles, &block)

        if session[:user] && roles.any?{ |r| session[:user].role.is r }
          block.call
        else
          status 401 #Unauthorized
          body 'No tiene los permisos necesarios'
        end

      end

      def set_as_admin_if_eligible
        AdminManager.instance.set_as_admin_if_eligible session[:user]
      end

    end
    helpers AuthHelper
  end
end
