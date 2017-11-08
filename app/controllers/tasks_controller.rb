class TasksController < ApplicationController

  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    # @tasks = Task.all.order('completed_on DESC')
    @incomplete_tasks = Task.incomplete_tasks.by_date
    @complete_tasks = Task.completed_tasks.by_date

    @completed_points = Task.calculate_complete_points
    @total_points = Task.calculate_total_points

    @percent_incomplete = Task.calculate_percent_incomplete
    @percent_complete = Task.calculate_percent_complete

  end

  def show
    # @task = Task.find(params['id'])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash.notice = 'Hooray! Task has been added to the docket!'
      redirect_to tasks_url
    else
      flash.now.alert = 'Uh ho! Something went wrong...'
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def task_params
    params.require(:task).permit(:name, :point_value, :completed_on)
  end

  def set_task
    @task = Task.find(params['id'])
  end

end
