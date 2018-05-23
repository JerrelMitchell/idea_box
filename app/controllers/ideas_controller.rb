class IdeasController < ApplicationController
  before_action :set_user_idea, only: [:show, :edit, :update, :destroy]
  before_action :require_current_user, only: [:index, :show]

  def index
    @ideas = current_user.ideas

  end

  def show
  end

  def new
    @user = current_user
    @idea = Idea.new
  end

  def edit; end

  def update
    if @idea.update(idea_params)
      redirect_to user_ideas_path(current_user), notice: 'Idea was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @idea.destroy
    redirect_to user_ideas_path(current_user), notice: 'Idea was successfully destroyed.'
  end

  def create
    @user = current_user
    @idea = current_user.ideas.create(idea_params)
    if @idea.save
      redirect_to user_ideas_path(current_user)
      flash[:notice] = 'Idea was successfully created.'
    else
      render :new
    end
  end

  private

    def require_current_user
      render file: 'public/404' unless current_user?
    end

    def set_user_idea
<<<<<<< HEAD
      @user = User.find(idea_params)
=======
      @user = current_user
>>>>>>> c19ccdd6db23707e28ee208c0b2fafcc32266ecf
      @idea = @user.ideas.find(params[:id])
    end

    def idea_params
      params.require(:idea).permit(:content, :title, :user_id)
    end
end
