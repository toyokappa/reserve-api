class Staff::ReserveMailer < Staff::ApplicationMailer
  def complete
    @name = params[:name]
    @program_name = params[:program_name]
    @scheduled_date = params[:scheduled_date]
    @required_time = params[:required_time]
    @trainee_name = params[:trainee_name]
    @tel = params[:tel]
    mail(to: params[:to], subject: '【予約システム】新たな予約のお知らせ')
  end
end