class Category < ApplicationRecord
    belongs_to  :user 
    has_many    :posts , dependent: :destroy

    validates :title, length: { maximum: 50,
        too_long: "%{count} characters is the maximum allowed" }
    validates :description, length: { maximum: 250,
        too_long: "%{count} characters is the maximum allowed" }
end