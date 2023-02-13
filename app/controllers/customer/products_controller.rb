class Customer::ProductsController < Customer::ApplicationController
  def index
    # TODO: 制限に引っかかったプロダクトを表示しないように実装
    @products = Product.all
  end
end