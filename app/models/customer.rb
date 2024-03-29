# frozen_string_literal: true

# == Schema Information
#
# Table name: customers
#
#  id                     :bigint           not null, primary key
#  address                :string(255)
#  allow_password_change  :boolean          default(FALSE)
#  birthday               :date
#  confirmation_sent_at   :datetime
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  email                  :string(255)
#  encrypted_password     :string(255)      default(""), not null
#  first_name             :string(255)
#  first_name_kana        :string(255)
#  image                  :string(255)
#  last_name              :string(255)
#  last_name_kana         :string(255)
#  postcode               :string(255)
#  provider               :string(255)      default("email"), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  tel                    :string(255)
#  tokens                 :text(65535)
#  uid                    :string(255)      default(""), not null
#  unconfirmed_email      :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_customers_on_confirmation_token    (confirmation_token) UNIQUE
#  index_customers_on_email                 (email) UNIQUE
#  index_customers_on_reset_password_token  (reset_password_token) UNIQUE
#  index_customers_on_uid_and_provider      (uid,provider) UNIQUE
#
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
  has_many :training_logs, dependent: :destroy
  has_many :body_metrics_logs, dependent: :destroy
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
