class RegistrationsController < Devise::RegistrationsController
  skip_before_filter :require_no_authentication
  before_filter :authenticate_scope!
  before_filter :check_permissions, :only => [:new, :create, :cancel]

  def check_permissions
    authorize! :create, resource
  end

  protected
    def after_update_path_for(resource)
      edit_user_registration_path
    end
end
