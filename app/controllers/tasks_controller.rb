class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
    # do not need when before_action is set_task
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new()
    # or @task = Task.new
  end

  def create
    new_task = Task.new(tasks_params)
    new_task.save
    redirect_to task_path(new_task)
    # or can redirect_to tasks_path (from solution)
  end

  def edit
    # do not need in here when before_action is set_task
    @task = Task.find(params[:id])
  end

  def update
    # do not need first line when before_action is set_task
    @task = Task.find(params[:id])
    @task.update(tasks_params)
    redirect_to task_path
  end

  def destroy
    task_to_delete = Task.find(params[:id])
    task_to_delete.destroy
    redirect_to tasks_path
    # or when before_action is set_task
    # @task.destroy
    # redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def tasks_params
    params.require(:task).permit(:name)
    # for batch 103 and then set before_action at the top
    # params.require(:task).permit(:title, :details, :completed)
  end
end
