class Category < ApplicationRecord
  belongs_to :user
  has_many :tasks,  dependent: :destroy
  validates :name, presence: true, uniqueness: { scope: :user_id,
    message: "should only have one instance per user"}
end
