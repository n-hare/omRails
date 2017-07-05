class AnswersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
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
    @question = Question.find($the_question.id)
    @answer = current_user.answers.new
  end

  # GET /answers/1/edit
  def edit
    @answer = current_user.answers.find(params[:id])
  end

  # POST /answers

  def create
    question = Question.find($the_question.id)
    @answer = question.answers.new(answer_params)
    @answer.user_id=current_user.id
      if @answer.save
        redirect_to question, notice: 'Answer was successfully created.' 
      else
        @question = Question.find(question.id)
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
    current_question = @answer.question
    @answer.destroy
    redirect_to current_question, notice: 'Answer was successfully destroyed.'
      
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:text)
    end
end
