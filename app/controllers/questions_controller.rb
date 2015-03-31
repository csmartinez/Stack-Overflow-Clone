class QuestionsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    if params[:posts_for] == "current"
      @questions = current_user.posts
    else
      @questions = Question.all
    end
  end

  def new
    @question = Question.new
  end

  def create
    @user = User.find(current_user.id)
    @question = @user.questions.new(question_params)
    if @question.save
      flash[:success] = "Question Successfully Added"
      redirect_to questions_path
    else
      flash[:danger] = "There was a problem creating your question, please try again."
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  private
  def question_params
    params.require(:question).permit(:body, :user_id)
  end

end
