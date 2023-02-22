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
  has_many :customer_group_customers, dependent: :destroy
  has_many :customer_groups, through: :customer_group_customers
  has_many :customer_coupons, dependent: :destroy
  has_many :coupons, through: :customer_coupons
  has_one :payjp_customer, dependent: :destroy

  mount_uploader :image, ImageUploader

  after_create :join_initial_group

  def full_name
    "#{last_name} #{first_name}"
  end

  private

  def join_initial_group
    # TODO: グループの特定の仕方は考えたほうが良さそう
    group = CustomerGroup.first
    return if group.blank?

    group.customers << self
  end
end
