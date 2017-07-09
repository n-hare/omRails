class UsersController < ApplicationController
  def show
    @user = User.find_by(username: params[:username])
    @liked_questions = @user.get_up_voted Question
  end
end
