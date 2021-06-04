require 'faker'

class WelcomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @categories = current_user.categories.all
    @category_id_list = @categories.map { |cat| cat.id }.uniq
    @tasks = []
    @list = Task.where(deadline: Date.today).or(Task.where(deadline: nil))
    @list.each do |t|
      if @category_id_list.include?(t.category_id)
        @tasks << t
      end
    end
  end
end
