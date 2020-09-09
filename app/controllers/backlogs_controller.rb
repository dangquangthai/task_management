class BacklogsController < ApplicationController
  before_action :new_task, only: [:index, :create]

  def index
    @tasks = task_filter.perform
  end

  def create
    if task_created?
      head :ok
    else
      render_new_task
    end
  end

  def update
    flash[:notice] = "Task's status has been updated" if existing_task.move_to_next_status!
    redirect_to backlogs_path
  end

  def destroy
    existing_task.destroy
    flash[:notice] = "Task has been deleted"
    redirect_to backlogs_path
  end

  private

  def task_filter
    @task_filter ||= TaskFilter.new(current_user: current_user, params: params)
  end

  def existing_task
    @existing_task ||= current_user.tasks.find(params[:id])
  end

  def render_new_task
    render(partial: 'backlogs/new_task', layout: false, status: :unprocessable_entity)
  end

  def task_created?
    new_task.assign_attributes(task_params)
    new_task.valid? && new_task.save
  end

  def new_task
    @new_task ||= current_user.tasks.build
  end

  def task_params
    params.require(:task).permit(:description, :important, :urgent)
  end
end
