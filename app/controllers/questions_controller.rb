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


  def show
    question_find
  end

  def index
    @questions = Question.all
  end

  def edit
    question_find
  end

  def update
    question_find
    if @question.update question_params
      redirec_to question_path(@question)
    else
      render :edit
  end

  def destroy
    question_find
    flash[:notice] = "Are You Sure?"
    @question.destroy
    redirect_to questions_path
  end


  private

  def question_params
    params.require(:question).permit(:title, :body)
  end

  def question_find
    @question = Question.find params[:id]
  end

  end

end
