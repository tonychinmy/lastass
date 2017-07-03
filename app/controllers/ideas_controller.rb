class IdeasController < ApplicationController
	before_action :find_idea, only: [:show, :edit, :update, :destroy]

	def index
		@ideas = Idea.all.order("created_at DESC")
	end

	def new
		@idea = Idea.new
	end

	def create
		@idea = Idea.new(idea_params)
		if @idea.save
			redirect_to @idea 
		else
			render 'new'
		end
	end

	def edit
	end

	def update
	end

	def show
	end

	def destroy
	end

	private

	def find_idea
		@idea = Idea.find(params[:id])
	end

	def idea_params
		params.require(:idea).permit(:title, :content)
	end
end

