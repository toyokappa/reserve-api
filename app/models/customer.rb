# frozen_string_literal: true

class Customer < ActiveRecord::Base
  extend Devise::Models

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  include DeviseTokenAuth::Concerns::User

  has_many :reservations, dependent: :destroy
  has_many :tickets, dependent: :destroy
  has_many :purchase_histories, dependent: :nullify
  has_one :payjp_customer, dependent: :destroy

  mount_uploader :image, ImageUploader

  enum :id_card_status, { in_review: 1, approved: 2, denied: 3 }

  def full_name
    "#{last_name} #{first_name}"
  end
end
