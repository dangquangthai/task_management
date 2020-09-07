class Task < ApplicationRecord
  extend Enumerize
  acts_as_paranoid

  belongs_to :user

  enumerize :status, in: %i[open inprogress closed], default: :open, scope: true, predicates: true

  validates :description, presence: true, length: { maximum: 40 }
end
