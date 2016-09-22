class User < ActiveRecord::Base
  has_many :news
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # new function to provide access to protected method unless_confirmed
  def only_if_unconfirmed
    pending_any_confirmation { yield }
  end

  def password_required?
    false
  end

  # new function to set the password without knowing the current password used in our confirmation controller.
  def attempt_set_password(params)
    p = {}
    p[:password] = params[:password]
    p[:password_confirmation] = params[:password_confirmation]
    update_attributes(p)
  end

  # new function to return whether a password has been set
  def no_password?
    encrypted_password.blank?
  end

  def password_match?
    password == password_confirmation
  end
end
