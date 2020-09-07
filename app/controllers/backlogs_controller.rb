class BacklogsController < ApplicationController
  def index
    @tasks = current_user.tasks.paginate(page: params[:page], per_page: 20)
  end
end
