class TasksController < ApplicationController
  before_action :authenticate_user!  
  before_action :get_category

  def index
    @categories = current_user.categories.all
    @category_id_list = @categories.map { |cat| cat.id }.uniq
    @tasks = []
    @list = Task.all
    @list.each do |t|
      if @category_id_list.include?(t.category_id)
        @tasks << t
      end
    end
  end

  def show
    @task = @category.tasks.find(params[:id])
  end

  def new
    @task = @category.tasks.build
  end

  def create
    @task = @category.tasks.build(task_params)

    if @task.save
      redirect_to category_tasks_path
    else
      render :new
    end

  end

  def edit
    @task = @category.tasks.find(params[:id])
  end

  def update
    @task = @category.tasks.find(params[:id])

    if @task.update(task_params)
      redirect_to category_tasks_path
    else
      render :edit
    end
  end

  def destroy
    @task = @category.tasks.find(params[:id])
    @task.destroy

    redirect_to category_tasks_path
  end

  private

  def get_category
    @category = Category.find(params[:category_id])
  end

  def task_params
    params.require(:task).permit(:name, :description, :deadline, :category_id)
  end
end
