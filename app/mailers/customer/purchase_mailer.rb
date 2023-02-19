class Customer::PurchaseMailer < Customer::ApplicationMailer
  def complete
    @name = params[:name]
    @product_name = params[:product_name]
    @purchased_at = params[:purchased_at]
    @total_amount = params[:total_amount]
    @payment_method = params[:payment_method]
    mail(to: params[:to], subject: '【予約システム】チケット購入完了のお知らせ')
  end
end