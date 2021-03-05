class User < ApplicationRecord
    validates   :first_name , presence: true
    validates   :last_name ,  presence: true
    validates   :email , presence: true, format: {with: %r{(.+)@(.+)\z}i }
    validates   :title , presence: true 
    validates   :avatar , presence: true, format: {with: %r{.(png|jpg|jpeg)\z}i, message: "Must be image data type (.jpg , .png,..)"}
    validates   :gender , presence: true , inclusion: {in: %w(male female other), message:"%{value} is not a valid gender type"}
    validates   :age , presence: true 
    validates   :role , presence: true , inclusion: {in: %w(admin user), message:"%{value} is not a valid role type"}
end