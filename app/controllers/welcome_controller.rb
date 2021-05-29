class WelcomeController < ApplicationController
  def index
    @categories = Category.all
    @tasks = Task.where(deadline: Date.today).or(Task.where(deadline: nil))
  end
end
