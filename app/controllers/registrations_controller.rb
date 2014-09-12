class RegistrationsController < Devise::RegistrationsController
  skip_before_filter :require_no_authentication
  before_filter :authenticate_scope!
  before_filter :check_permissions, :only => [:new, :create, :cancel]

  def check_permissions
    authorize! :create, resource
  end
end
