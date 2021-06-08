require 'faker'

class WelcomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @categories = current_user.categories.order(updated_at: :desc).limit(11)
    @categories2 = current_user.categories.all
    @category_id_list = @categories2.map { |cat| cat.id }.uniq
    @tasks = []
    @list = Task.where(deadline: Date.today).or(Task.where(deadline: nil)).order(updated_at: :desc).limit(7)
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

    @overdue_tasks = []
    @overdue_list = Task.where(deadline: Date.today.at_beginning_of_year..Date.yesterday).order(updated_at: :desc).limit(7)
    @overdue_list.each do |t|
      if @category_id_list.include?(t.category_id)
        @overdue_tasks << t
      end
    end

    @overdue_tasks2 = []
    @overdue_list2 = Task.where(deadline: Date.today.at_beginning_of_year..Date.yesterday)
    @overdue_list2.each do |t|
      if @category_id_list.include?(t.category_id)
        @overdue_tasks2 << t
      end
    end

  end
end
