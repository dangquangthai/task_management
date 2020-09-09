require 'rails_helper'

RSpec.describe TaskFilter do
  let!(:task_01) { create(:task, status: :inprogress) }
  let!(:task_02) { create(:task, status: :closed, user: task_01.user) }
  let!(:task_03) { create(:task, user: task_01.user) }
  let(:current_user) { task_01.user }

  let(:expected_params) do
    ActionController::Parameters.new({
      "show_all" => expected_show_all
    })
  end

  subject { described_class.new(current_user: current_user, params: expected_params) }

  describe '#perform' do
    context 'when show_all is true' do
      let(:expected_show_all) { 'true' }

      it { expect(subject.perform).to match_array([task_01, task_02, task_03]) }
    end

    context 'when show_all is not true' do
      let(:expected_show_all) { nil }

      it { expect(subject.perform).to match_array([task_01, task_03]) }
    end
  end
end
