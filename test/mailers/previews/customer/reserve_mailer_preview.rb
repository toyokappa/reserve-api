class Customer::ReserveMailerPreview < ActionMailer::Preview
  def complete_customer
    reserve_mailer.complete_customer
  end

  def complete_guest
    reserve_mailer.complete_guest
  end

  def cancel
    reserve_mailer.cancel
  end

  private

  def reserve_mailer
    Customer::ReserveMailer.with(
      to: 'test@example.com',
      name: '田中 太郎',
      tel: '080-1234-5678',
      message: 'よろしくおねがいします',
      program_name: '無料体験トレーニング',
      scheduled_date: I18n.l(Time.current, format: :datetime_short),
      required_time: 60,
      trainer_name: 'HANAKO',
    )
  end
end