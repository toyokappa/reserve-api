class Customer::PurchaseMailerPreview < ActionMailer::Preview
  def complete
    Customer::PurchaseMailer.with(
      to: 'test@example.com',
      name: '田中 太郎',
      product_name: '2ヶ月コース',
      purchased_at: I18n.l(Time.current, format: :datetime_short),
      total_amount: 1000000,
      payment_method: 'クレジットカード支払い',
    ).complete
  end
end