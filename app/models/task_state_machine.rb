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
      aasm.states(permitted: true).map(&:name).first
    end

    def move_to_next_status!
      send("#{next_event}!") if next_event.present?
    end

    private

    def next_event
      aasm.events(permitted: true).map(&:name).first
    end
  end
end
