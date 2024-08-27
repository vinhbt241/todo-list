# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :prepare_task, only: %i[edit update destroy]

  def index
    @tasks = Task.pending.order(priority: :desc)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.prepend(:tasks, partial: 'tasks/item', locals: { task: @task }),
            turbo_stream.replace(:task_form, partial: 'tasks/form', locals: { task: Task.new })
          ]
        end
        format.html do
          redirect_to tasks_path
        end
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @task.update(task_params)
      redirect_to tasks_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy!

    redirect_to tasks_path
  end

  private

  def prepare_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(
      :title,
      :sub_title,
      :priority,
      :due_date,
      :status
    )
  end
end
