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

  describe 'POST #create' do
    context 'invalid params' do
      let(:expected_params) do
        {
          description: '',
          important: true,
          urgent: false
        }
      end

      it 'should not create any task' do
        expect{
          post :create, params: { task: expected_params }, xhr: true
        }.not_to change { current_user.tasks.count }

        expect(response.content_type).to eq 'text/html'
        expect(response.status).to eq(422)
        expect(response).to render_template('backlogs/_new_task')
      end
    end

    context 'valid params' do
      let(:created_task) { current_user.tasks.first }
      let(:expected_params) do
        {
          description: 'hello',
          important: true,
          urgent: false
        }
      end

      it 'should creates 1 task' do
        expect{
          post :create, params: { task: expected_params }, xhr: true
        }.to change { current_user.tasks.count }.by(1)

        expect(response).to be_success
        
        expect(created_task.description).to eq 'hello'
        expect(created_task.important).to be true
        expect(created_task.urgent).to be false
        expect(created_task.open?).to be true
      end
    end
  end
end
