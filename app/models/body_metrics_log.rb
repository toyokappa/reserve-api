# == Schema Information
#
# Table name: body_metrics_logs
#
#  id          :bigint           not null, primary key
#  logged_at   :datetime
#  photo       :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :bigint           not null
#  staff_id    :bigint
#
# Indexes
#
#  index_body_metrics_logs_on_customer_id  (customer_id)
#  index_body_metrics_logs_on_staff_id     (staff_id)
#
# Foreign Keys
#
#  fk_rails_...  (customer_id => customers.id)
#  fk_rails_...  (staff_id => staffs.id)
#
class BodyMetricsLog < ApplicationRecord
  belongs_to :customer
  mount_uploader :photo, ImageUploader
end
