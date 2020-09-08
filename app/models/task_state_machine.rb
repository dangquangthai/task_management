module TaskStateMachine
  extend ActiveSupport::Concern

  included do
    include AASM

    aasm column: :status do
      state :open, initial: true
      state :open, :inprogress, :closed

      event :move_to_inprogress do
        transitions from: :open, to: :inprogress
      end

      event :move_to_closed do
        transitions from: :inprogress, to: :closed
      end
    end

    def next_status
      aasm.states(permitted: true).map(&:name).first&.to_s
    end
  end
end
