class ShortenedUrl < ApplicationRecord

    validates :user_id, presence: true
    validates :long_url, presence: true
    validates :short_url, presence: true, uniqueness: true  

end 