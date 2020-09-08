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
end
