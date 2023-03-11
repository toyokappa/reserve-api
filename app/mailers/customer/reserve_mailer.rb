class Customer::ReserveMailer < Customer::ApplicationMailer
  def complete_customer
    @name = params[:name]
    @tel = params[:tel]
    @program_name = params[:program_name]
    @scheduled_date = params[:scheduled_date]
    @required_time = params[:required_time]
    @trainer_name = params[:trainer_name]
    mail(to: params[:to], subject: '【予約システム】予約完了のお知らせ')
  end

  def complete_guest
    @name = params[:name]
    @tel = params[:tel]
    @message = params[:message]
    @program_name = params[:program_name]
    @scheduled_date = params[:scheduled_date]
    @required_time = params[:required_time]
    @trainer_name = params[:trainer_name]
    mail(to: params[:to], subject: '【予約システム】予約完了のお知らせ')
  end

  def cancel
    @name = params[:name]
    @program_name = params[:program_name]
    @scheduled_date = params[:scheduled_date]
    @trainer_name = params[:trainer_name]
    mail(to: params[:to], subject: '【予約システム】予約キャンセルのお知らせ')
  end
end