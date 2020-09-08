class Task < ApplicationRecord
  extend Enumerize
  acts_as_paranoid

  belongs_to :user

  enumerize :status, in: %i[open inprogress closed], default: :open, scope: true, predicates: true

  validates :description, presence: true, length: { maximum: 40 }

  def important_text
    important? ? 'Important' : 'Not Important'
  end

  def important_css
    important? ? 'badge badge-danger' : 'badge badge-light'
  end

  def urgent_text
    urgent? ? 'Urgent' : 'Not Urgent'
  end

  def urgent_css
    urgent? ? 'badge badge-warning' : 'badge badge-light'
  end
end
