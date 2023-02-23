class Admin::StaffsController < Admin::ApplicationController
  def index
    @trainers = Staff.all
  end
end