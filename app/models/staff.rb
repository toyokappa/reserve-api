# frozen_string_literal: true

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

  def full_name
    "#{last_name} #{first_name}"
  end
end
