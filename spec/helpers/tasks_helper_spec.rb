require 'rails_helper'

RSpec.describe TasksHelper, type: :helper do
  describe '#task_status_badge' do
    context 'when status is open' do
      let(:task) { build_stubbed(:task, status: :open) }

      it { expect(helper.task_status_badge(task)).to eq "<span class=\"badge badge-primary\">Open</span>" }
    end

    context 'when status is inprogress' do
      let(:task) { build_stubbed(:task, status: :inprogress) }

      it { expect(helper.task_status_badge(task)).to eq "<span class=\"badge badge-success\">In-Progress</span>" }
    end

    context 'when status is closed' do
      let(:task) { build_stubbed(:task, status: :closed) }

      it { expect(helper.task_status_badge(task)).to eq "<span class=\"badge badge-secondary\">Closed</span>" }
    end
  end
end
