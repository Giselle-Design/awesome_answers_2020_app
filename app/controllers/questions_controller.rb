class QuestionsController < ApplicationController
  before_action :find_question, only: [:show, :edit, :update, :destroy]

  def new
    @question = Question.new
  end

  def create

    @question=Question.new question_params
    if @question.save
      flash[:notice] = "Question Created Successfully"
      redirect_to question_path(@question)
    else
      render :new
    end
  end


  def show
    @answer = Answer.new
    @answers = @question.answers.order(created_at: :desc)
  end

  def index
    @questions = Question.all
  end

  def edit
  end

  def update
    if @question.update question_params
      redirect_to question_path(@question)
    else
      render :edit
    end
  end

  def destroy
      flash[:notice] = "Question Deleted!"
      @question.destroy
      redirect_to questions_path
  end




  private

  def question_params
    params.require(:question).permit(:title, :body)
  end


  def find_question
      # get the Question with the id that's requested
      @question = Question.find params[:id]
  end



end
