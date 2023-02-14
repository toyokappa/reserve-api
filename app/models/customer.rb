# frozen_string_literal: true

class Customer < ActiveRecord::Base
  extend Devise::Models

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_many :reservations, dependent: :destroy
  has_many :tickets, dependent: :destroy
  has_many :purchase_histories, dependent: :nullify
  has_one :payjp_customer, dependent: :destroy

  def full_name
    "#{last_name} #{first_name}"
  end
end
