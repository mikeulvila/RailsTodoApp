class TodoList < ActiveRecord::Base
  validates :title, presence: true
end
