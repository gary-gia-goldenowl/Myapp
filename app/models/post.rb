class Post < ApplicationRecord
    validates :title , length: {maximum: 50,
        too_long: "%{count} characters is the maximum allowed"}
    validates :content , length: {maximum: 250,
        too_long: "%{count} characters is the maximum allowed"}

end
