class Post < ApplicationRecord
    belongs_to :user 
    belongs_to :category

    validates :title , length: {maximum: 50,
        too_long: "%{count} characters is the maximum allowed"}
    validates :content , length: {maximum: 250,
        too_long: "%{count} characters is the maximum allowed"}
    validates   :images , presence: true, format: {with: %r{.(png|jpg|jpeg)\z}i, message: "Must be image data type (.jpg , .png,..)"}


end
