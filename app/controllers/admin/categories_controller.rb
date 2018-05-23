class Admin::CategoriesController < Admin::BaseController
  before_action :set_admin_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @admin = current_user
    @category = Category.new
  end

  def edit; end

  def update
    if @category.update(category_params)
      redirect_to admin_categories_path(current_user), notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_path(current_user), notice: 'Category was successfully destroyed.'
  end

  def create
    @admin = current_user
    @category = current_user.categories.create(category_params)
    if @category.save
      redirect_to admin_categories_path(current_user)
      flash[:notice] = 'Category was successfully created.'
    else
      render :new
    end
  end

  private

    def set_admin_category
      @admin = current_user
      @category = @admin.categories.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:title, :user_id)
    end
end
