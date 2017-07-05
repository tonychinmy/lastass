class CommentsController < ApplicationController
	before_action :check_owner, only: [:edit, :update, :destroy]

	def index

	end

	def new
		@idea = Idea.find(params[:idea_id])
		@comment = Comment.new
	end

	def create
		@comment = current_user.comments.new(comment_params)
		@comment.idea_id = params[:idea_id]
		if @comment.save
		 flash[:success] = 'Comment created'
		else
		 flash[:error] = 'Comment not created. Please try again'
		end
		respond_to do |format|
			format.html { redirect_to idea_path }
			format.js {}
		end
	end

	def show
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private
	def check_owner
    unless @comment.user_id == current_user.id
      redirect_to root_path, notice: "You are not allowed to access that page."
    end
  end

	def comment_params
		params.require(:comment).permit(:content)
	end
end
