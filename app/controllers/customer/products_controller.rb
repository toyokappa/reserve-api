class Customer::ProductsController < Customer::ApplicationController
  def index
    # TODO: 制限に引っかかったプロダクトを表示しないように実装
    @product_sets = ProductSet.all.includes(:product_assigns, :product_items)
  end
end