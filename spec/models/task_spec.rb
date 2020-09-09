require 'rails_helper'

RSpec.describe Task, type: :model do
  describe '.enumeration' do
    it do 
      is_expected.to enumerize(:status)
        .in(%i[open inprogress closed])
        .with_scope(true)
        .with_default(:open)
        .with_predicates(true)
    end
  end

  describe '.validation' do
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_length_of(:description).is_at_most(40) }
  end

  describe '.associations' do
    it { is_expected.to belong_to(:user) }
  end

  describe '#important_text, #important_css' do
    context 'when important is true' do
      let(:task) { build_stubbed(:task, important: true) }

      it { expect(task.important_text).to eq 'Important' }
      it { expect(task.important_css).to eq 'badge badge-danger' }
    end

    context 'when important is false' do
      let(:task) { build_stubbed(:task, important: false) }

      it { expect(task.important_text).to eq 'Not Important' }
      it { expect(task.important_css).to eq 'badge badge-light' }
    end
  end

  describe '#urgent_text, #urgent_css' do
    context 'when urgent is true' do
      let(:task) { build_stubbed(:task, urgent: true) }

      it { expect(task.urgent_text).to eq 'Urgent' }
      it { expect(task.urgent_css).to eq 'badge badge-warning' }
    end

    context 'when urgent is false' do
      let(:task) { build_stubbed(:task, urgent: false) }

      it { expect(task.urgent_text).to eq 'Not Urgent' }
      it { expect(task.urgent_css).to eq 'badge badge-light' }
    end
  end

  describe '.AASM' do
    describe '.events' do
      let(:task) { build_stubbed(:task) }

      it do
        expect(task).to transition_from(:open).to(:inprogress).on_event(:move_to_inprogress)
        expect(task).to transition_from(:inprogress).to(:closed).on_event(:move_to_closed)
      end
    end

    describe '#next_status' do
      context 'when task is open' do
        let(:task) { build_stubbed(:task) }

        it { expect(task.next_status).to eq :inprogress }
      end

      context 'when task is inprogress' do
        let(:task) { build_stubbed(:task, status: :inprogress) }

        it { expect(task.next_status).to eq :closed }
      end

      context 'when task is closed' do
        let(:task) { build_stubbed(:task, status: :closed) }

        it { expect(task.next_status).to be nil }
      end
    end

    describe '#move_to_next_status!' do
      context 'when task is open' do
        let(:task) { create(:task) }

        it do
          expect(task.move_to_next_status!).to be true
          expect(task.inprogress?).to be true
        end
      end

      context 'when task is inprogress' do
        let(:task) { create(:task, status: :inprogress) }

        it do
          expect(task.move_to_next_status!).to be true
          expect(task.closed?).to be true
        end
      end

      context 'when task is closed' do
        let(:task) { create(:task, status: :closed) }

        it do
          expect(task.move_to_next_status!).to be_nil
          expect(task.closed?).to be true
        end
      end
    end
  end
end
