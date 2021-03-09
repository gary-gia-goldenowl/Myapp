class User < ApplicationRecord
    has_many    :posts , dependent: :destroy
    has_many    :categories , dependent: :destroy

    validates   :first_name, presence: true
    validates   :last_name,  presence: true
    validates   :email, presence: true, format: {with: %r{(.+)@(.+)\z}i }
    validates   :title, presence: true 
    validates   :gender, presence: true , inclusion: {in: %w(male female other), message:"%{value} is not a valid gender type"}
    validates   :age, presence: true 
    validates   :role, presence: true , inclusion: {in: %w(admin user), message:"%{value} is not a valid role type"}
end