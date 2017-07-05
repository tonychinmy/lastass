class Idea < ApplicationRecord
	
	belongs_to :user
	has_many :comments, dependent: :destroy
	paginates_per 8
	# include PgSearch
	# pg_search_scope :search_by_title, :against => :title
	# pg_search_scope :search_by_content, :against => :content
	scope :title, -> (title) { where "LOWER(title) LIKE LOWER(?)", "%#{title}%" }
end
