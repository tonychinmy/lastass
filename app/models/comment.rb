class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :idea
  paginates_per 8
end
