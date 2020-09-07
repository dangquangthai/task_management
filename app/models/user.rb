class User < ApplicationRecord
  devise :database_authenticatable, :validatable, :registerable, :authentication_keys => [:username]

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end
end
