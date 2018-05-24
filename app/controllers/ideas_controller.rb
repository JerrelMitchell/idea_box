class IdeasController < ApplicationController
  before_action :set_user_idea, only: [:show, :edit, :update, :destroy]
  before_action :set_current_user, only: [:new, :create]
  before_action :require_current_user, only: [:index, :show]

  def show; end

  def edit; end

  def index
    @ideas = current_user.ideas
  end

  def new
    @idea = Idea.new
  end

  def update
    if @idea.update(idea_params)
      redirect_to user_ideas_path(current_user), notice: 'Idea was successfully updated.'
    else
      render :edit
      flash[:notice] = 'Fill in all fields before submitting!'
    end
  end

  def destroy
    @idea.destroy
    redirect_to user_ideas_path(current_user), notice: 'Idea was successfully destroyed.'
  end

  def create
    @idea = @user.ideas.create(idea_params)
    if @idea.save
      redirect_to user_ideas_path(current_user)
      flash[:notice] = 'Idea was successfully created.'
    else
      render :new
      flash[:notice] = 'Fill in all fields before submitting!'
    end
  end

  private

    def require_current_user
      render file: 'public/404' unless current_user?
    end

    def set_current_user
      @user = current_user
    end

    def set_user_idea
      @user = current_user
      @idea = @user.ideas.find(params[:id])
    end

    def idea_params
      params.require(:idea).permit(:content, :title, :user_id)
    end
end
