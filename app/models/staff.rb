# frozen_string_literal: true

# == Schema Information
#
# Table name: staffs
#
#  id                     :bigint           not null, primary key
#  allow_password_change  :boolean          default(FALSE)
#  comment                :string(255)      default("")
#  confirmation_sent_at   :datetime
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  display_name           :string(255)
#  email                  :string(255)
#  encrypted_password     :string(255)      default(""), not null
#  first_name             :string(255)
#  frequency              :integer          default(1), not null
#  image                  :string(255)
#  last_name              :string(255)
#  provider               :string(255)      default("email"), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  tokens                 :text(65535)
#  uid                    :string(255)      default(""), not null
#  unconfirmed_email      :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_staffs_on_confirmation_token    (confirmation_token) UNIQUE
#  index_staffs_on_email                 (email) UNIQUE
#  index_staffs_on_reset_password_token  (reset_password_token) UNIQUE
#  index_staffs_on_uid_and_provider      (uid,provider) UNIQUE
#
class Staff < ActiveRecord::Base
  extend Devise::Models

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  mount_uploader :image, ImageUploader

  has_many :shifts, dependent: :destroy
  has_many :program_staffs, dependent: :destroy
  has_many :reservations, dependent: :destroy

  validates :frequency, numericality: { in: 1..10 }

  def full_name
    "#{last_name} #{first_name}"
  end
end
