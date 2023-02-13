class Customer::ProductsController < Customer::ApplicationController
  def index
    # TODO: 制限に引っかかったプロダクトを表示しないように実装
    @product_sets = ProductSet.all.includes(:product_assigns, :product_items)
  end

  def show
    @product_set = ProductSet.includes(:product_assigns, :product_items).find(params[:id])
    @main_product = @product_set.product_assigns.find_by(is_main: true)
  end
end