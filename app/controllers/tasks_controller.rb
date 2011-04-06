class TasksController < ApplicationController
  def index
    @tasks = Task.unfinished_tasks
  end

  def create
    @task = Task.new(:title => params[:title])
    if @task.save
      redirect_to '/'
    else
      @tasks = Task.unfinished_tasks
      render "index"
    end
  end

  def done
    Task.find(params[:id]).update_attribute(:done_date, Time.now)
    redirect_to '/'
  end
end
