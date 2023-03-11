class Staff::ReserveMailerPreview < ActionMailer::Preview
  def complete
    reserve_mailer.complete
  end

  def cancel
    reserve_mailer.cancel
  end

  private

  def reserve_mailer
    Staff::ReserveMailer.with(
      to: 'test@example.com',
      name: '山田 花子',
      tel: '080-1234-5678',
      message: 'よろしくおねがいします',
      program_name: '無料体験トレーニング',
      scheduled_date: I18n.l(Time.current, format: :datetime_short),
      required_time: 60,
      trainee_name: '田中 太郎',
    )
  end
end