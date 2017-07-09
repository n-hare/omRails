class VotesController < ApplicationController
    before_action :authenticate_user!
    def create
        answer = Answer.find(params[:id])
        answer.liked_by current_user
        redirect_to answer.question, notice: 'You successfully voted for this answer'
    end

    def destroy
        answer = Answer.find(params[:id])
        answer.unliked_by current_user
        redirect_to answer.question, notice: 'You successfully unvoted for this answer'
    end
end