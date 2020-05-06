class Admin::CategoriesController < Admin::BaseController
  def index
    @categories = Category.order(id: :desc).all # end #   { line_item: item, product: Product.find(item.product_id) } # @order.line_items.map do |item| # end #   {    } # @categories = @categories.map do |category|
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
