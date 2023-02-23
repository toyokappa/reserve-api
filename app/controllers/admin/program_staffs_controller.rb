class Admin::ProgramStaffsController < Admin::ApplicationController
  def create
    program = Program.find(assign_params[:program_id])
    staff = Staff.find(assign_params[:staff_id])
    program.staffs << staff
    @assigned_trainers = program.staffs
    @wait_trainers = Staff.where.not(id: @assigned_trainers)
  end

  def destroy
    program = Program.find(assign_params[:program_id])
    staff = Staff.find(assign_params[:staff_id])
    program.staffs.destroy(staff)
    @assigned_trainers = program.staffs
    @wait_trainers = Staff.where.not(id: @assigned_trainers)
  end

  private

  def assign_params
    params.require(:assign).permit(:program_id, :staff_id)
  end
end