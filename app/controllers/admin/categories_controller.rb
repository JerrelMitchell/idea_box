class Admin::CategoriesController < Admin::BaseController
  before_action :set_admin_category, only: [:show, :edit, :update, :destroy]

  def show; end

  def edit; end

  def new
    @category = Category.new
  end

  def index
    @categories = Category.all
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_path, notice: 'Category was successfully destroyed.'
  end

  def update
    if @category.update(category_params)
      redirect_to admin_categories_path, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  def create
    @admin = current_user
    @category = @admin.categories.create(category_params)
    if @category.save
      redirect_to admin_categories_path
      flash[:notice] = 'Category was successfully created.'
    else
      render :new
    end
  end

  private

    def set_admin_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:title, :user_id)
    end
end
