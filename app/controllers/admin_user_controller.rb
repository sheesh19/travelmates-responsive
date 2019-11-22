class ActiveAdmin::Devise::SessionsController
    skip_before_action :authenticate_user!

    def after_sign_in_path_for(resource)
        admin_dashboard_path
    end
end