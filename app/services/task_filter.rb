class TaskFilter
  def initialize(current_user:, params:)
    @current_user = current_user
    @params = params
  end

  def perform
    if show_all?
      current_user.tasks 
    else
      current_user.tasks.opening
    end.paginate(page: params[:page], per_page: 20)
  end

  def show_all?
    params[:show_all] == 'true'
  end

  private

  attr_reader :current_user, :params
end
