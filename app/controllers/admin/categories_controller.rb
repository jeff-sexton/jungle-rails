class Admin::CategoriesController < Admin::BaseController
  def index
    @categories = Category.order(id: :desc).all
    @categories =
      @categories.map do |category|
        {
          category: category,
          product_count: Product.where('category_id = ?', category.id).count
        }
      end
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to %i[admin categories], notice: 'Category created!'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
