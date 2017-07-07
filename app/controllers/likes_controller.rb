class LikesController < ApplicationController
    before_action :authenticate_user!
    def create
        question = Question.find(params[:id])
        question.liked_by current_user
        redirect_to question_path, notice: 'You successfully liked this question'
    end

    def destroy
        question = Question.find(params[:id])
        question.unliked_by current_user
        redirect_to question_path, notice: 'You successfully unliked this question'
    end
end
