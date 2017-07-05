class Idea < ApplicationRecord
	belongs_to :user
	has_many :comments, dependent: :destroy
	paginates_per 8
end
