class WelcomeController < ApplicationController
  def index
  	unless logged_in?
      redirect_to login_path
   	end

   	user_ideas = Idea.where(user_id: current_user)
   	@user_ideas = user_ideas.order("created_at DESC").page params[:page]
  end

  private
	# A list of the param names that can be used for filtering the Product list
  def filtering_params(params)
	  params.slice(:search, :title, :content)
	end
end
