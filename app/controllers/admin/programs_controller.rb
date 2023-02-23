class Admin::ProgramsController < Admin::ApplicationController
  def index
    @programs = Program.all
  end

  def show
    @program = Program.find(params[:id])
    @assigned_trainers = @program.staffs
    @wait_trainers = Staff.where.not(id: @assigned_trainers)
  end
end