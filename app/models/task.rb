class Task < ActiveRecord::Base
  validates_presence_of :title

  scope :unfinished_tasks, where(:done_date => nil)
end
