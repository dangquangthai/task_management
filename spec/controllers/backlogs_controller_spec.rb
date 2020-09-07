require 'rails_helper'

RSpec.describe BacklogsController, type: :controller do
  let(:current_user) { create(:user) }
  before { sign_in current_user }

  describe 'GET #index' do
    let!(:task) { create(:task, user: current_user) }

    before { get :index }

    specify do
      expect(response.content_type).to eq 'text/html'
      expect(response.status).to eq(200)
      expect(response).to render_template(:index)
      expect(response).to render_template('backlogs/_tasks')
      expect(response).to render_template('backlogs/_task')
      expect(response).to render_template('backlogs/_new_task')
      expect(assigns(:tasks)).to eq([task])
    end
  end
end
