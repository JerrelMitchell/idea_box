class Admin::CategoriesController < Admin::BaseController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to admin_categories_path, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to admin_categories_path, notice: 'Category was successfully destroyed.'
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

    def category_params
      params.require(:category).permit(:title, :user_id)
    end
end
