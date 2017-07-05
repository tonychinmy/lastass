class WelcomeController < ApplicationController
  def index
  	unless logged_in?
      redirect_to login_path
   	end

   	user_ideas = Idea.where(user_id: current_user)
   	@user_ideas = user_ideas.order("created_at DESC").page params[:page]
  end
end
