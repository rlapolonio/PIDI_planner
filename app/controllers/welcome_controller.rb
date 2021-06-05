require 'faker'

class WelcomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @categories = current_user.categories.all.limit(11)
    @categories2 = current_user.categories.all
    @category_id_list = @categories.map { |cat| cat.id }.uniq
    @tasks = []
    @list = Task.where(deadline: Date.today).or(Task.where(deadline: nil)).limit(7)
    @list.each do |t|
      if @category_id_list.include?(t.category_id)
        @tasks << t
      end
    end
    @tasks2 = []
    @list2 = Task.where(deadline: Date.today).or(Task.where(deadline: nil))
    @list2.each do |t|
      if @category_id_list.include?(t.category_id)
        @tasks2 << t
      end
    end
  end
end
