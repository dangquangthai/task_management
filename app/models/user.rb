class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :authentication_keys => [:username]

  validates :username,
    presence: true,
    length: { minimum: 8, maximum: 16 },
    format: { with: /\A[a-zA-Z0-9 ]+\z/ }
  validates :password,
    presence: true,
    length: { minimum: 8, maximum: 16 },
    format: { with: /(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}/ }
  validates_uniqueness_of :username

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
