class WelcomeController < ApplicationController
  def index
    @categories = Category.all
    @tasks = Task.where(deadline: (DateTime.now.midnight)..DateTime.tomorrow.midnight).or(Task.where(deadline: nil))
  end
end
