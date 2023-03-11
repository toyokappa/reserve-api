# == Schema Information
#
# Table name: program_staffs
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  program_id :bigint           not null
#  staff_id   :bigint           not null
#
# Indexes
#
#  index_program_staffs_on_program_id  (program_id)
#  index_program_staffs_on_staff_id    (staff_id)
#
# Foreign Keys
#
#  fk_rails_...  (program_id => programs.id)
#  fk_rails_...  (staff_id => staffs.id)
#
class ProgramStaff < ApplicationRecord
  belongs_to :program
  belongs_to :staff
end
