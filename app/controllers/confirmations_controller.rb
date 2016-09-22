class ConfirmationsController < Devise::ConfirmationsController
  skip_before_filter :authenticate_user!

  # PUT /resource/confirmation
  def update
    with_unconfirmed_confirmable do
      if @confirmable.no_password?
        set_password
      else
        @confirmable.errors.add(:email, :password_already_set)
      end
    end
    detect_and_render_errors
  end

  # GET /resource/confirmation?confirmation_token=abcdef
  def show
    with_unconfirmed_confirmable do
      if @confirmable.no_password?
        do_show
      else
        do_confirm
      end
    end
    detect_and_render_errors
  end

  protected

  def with_unconfirmed_confirmable
    original_token = params[:confirmation_token]
    # as of devise 3.5.2, the digested token isn't stored anymore
    @confirmable = User.find_or_initialize_with_error_by(:confirmation_token, original_token)
    @confirmable.only_if_unconfirmed { yield } unless @confirmable.new_record?
  end

  def do_show
    @confirmation_token = params[:confirmation_token]
    @requires_password = true
    self.resource = @confirmable
    render 'devise/confirmations/show' # Change this if you don't have the views on default path
  end

  def do_confirm
    @confirmable.confirm!
    set_flash_message :notice, :confirmed
    sign_in_and_redirect(resource_name, @confirmable)
  end

  private

  def detect_and_render_errors
    return unless @confirmable.errors.any?
    self.resource = @confirmable
    render 'devise/confirmations/new'
  end

  def set_password
    @confirmable.attempt_set_password(params[:user])
    if @confirmable.valid? && @confirmable.password_match?
      do_confirm
    else
      do_show
      @confirmable.errors.clear # so that we wont render :new
    end
  end
end
