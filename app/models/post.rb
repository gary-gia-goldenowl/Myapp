class Post < ApplicationRecord
    belongs_to :user 
    belongs_to :category
    has_many_attached :images

    validates :title, presence: true, length: {maximum: 50,
        too_long: "%{count} characters is the maximum allowed"}
    validates :content, length: {maximum: 250,
        too_long: "%{count} characters is the maximum allowed"}
    validates   :images, presence: true


end