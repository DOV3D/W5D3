require 'action_view'
class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper

    validates :color, inclusion: {in: %w(yellow orange black), message: "not a valid color"}
    validates :sex, inclusion: {in: %w(m f), message: "not a valid sex" }
    validates :birth_date, presence: true 
    validates :color, presence: true 
    validates :name, presence: true 
    validates :sex, presence: true 
    validates :description, presence: true 


    def age
        time_ago_in_words(birth_date)
        #new_date = Date.parse(birth_date)
        #date_select(Cat, date_separator: birth_date, )

    end 

end
