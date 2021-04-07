class User < ApplicationRecord
    has_many    :posts , dependent: :destroy
    has_many    :categories , dependent: :destroy
    has_one_attached :avatar 

    validates   :first_name, presence: true
    validates   :last_name,  presence: true
    validates   :email, presence: true, format: { with: %r{(.+)@(.+)\z}i }
    validates   :gender, presence: true, inclusion: { in: %w(male female other), message:"%{value} is not a valid gender type" }
    validates   :age, presence: true, numericality: { greater_than: 0 }
    validates   :role, presence: true, inclusion: { in: %w(admin user), message:"%{value} is not a valid role type" }
    validates   :avatar, presence: true

    scope :male, -> { where gender: 'male' }
    scope :female, -> { where gender: 'female' }
  end