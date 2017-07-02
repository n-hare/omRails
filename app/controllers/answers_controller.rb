class AnswersController < ApplicationController

  # GET /answers
  def index
    @answers = Answer.all
  end

  # GET /answers/1
  def show
    @answer = Answer.find(params[:id])
  end

  # GET /answers/new
  def new
    @answer = current_user.answers.new
  end

  # GET /answers/1/edit
  def edit
    @answer = current_user.answers.find(params[:id])
  end

  # POST /answers

  def create

    @answer = current_user.answers.new(answer_params)
      if @answer.save
        redirect_to question, notice: 'Answer was successfully created.' 
      else
        render :new 
      end
  end

  # PATCH/PUT /answers/1
 
  def update
    @answer = current_user.answers.find(params[:id]) 
      if @answer.update(answer_params)
        redirect_to @answer, notice: 'Answer was successfully updated.' 
      else
        render :edit
      end
  end

  # DELETE /answers/1
  def destroy
    @answer = current_user.answers.find(params[:id])
    @answer.destroy
    redirect_to answers_url, notice: 'Answer was successfully destroyed.'
      
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:text)
    end
end
