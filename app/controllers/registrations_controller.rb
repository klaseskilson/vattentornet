class RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!
end
