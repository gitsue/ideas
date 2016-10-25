class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :idea, counter_cache: true
end
