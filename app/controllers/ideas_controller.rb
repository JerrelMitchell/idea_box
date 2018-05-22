class IdeasController < ApplicationController
  before_action :set_user_idea, only: [:show, :edit, :update, :destroy]

  def index
    @ideas = Idea.all
  end

  def show
    @user = User.find(idea_params(:user_id))
  end

  def new
    @idea = Idea.new
  end

  def edit; end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save
      redirect_to @idea, notice: 'Idea was successfully created.'
    else
      render :new
    end
  end

  def update
    if @idea.update(idea_params)
      redirect_to @idea, notice: 'Idea was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @idea.destroy
    redirect_to ideas_url, notice: 'Idea was successfully destroyed.'
  end

  private

    def set_user_idea
      @user = User.find(idea_params(:user_id))
      @idea = Idea.find(params[:id])
    end

    def idea_params
      params.require(:idea).permit(:content, :user_id)
    end
end
