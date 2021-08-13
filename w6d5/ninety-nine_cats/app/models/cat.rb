require 'action_view'
class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper

    validates :cats, :color, inclusion: {in: %w(yellow orange black), message: "%{color} is not a valid color"}
    validates :cats, :sex, inclusion: {in: %w('M' 'F'), message: "%{sex} is not a valid sex" }
    validates :cats, :birth_date, presence: true 
    validates :cats, :color, presence: true 
    validates :cats, :name, presence: true 
    validates :cats, :sex, presence: true 
    validates :cats, :description, presence: true 


    def age
        time_ago_in_words(birth_date)
        #new_date = Date.parse(birth_date)
        #date_select(Cat, date_separator: birth_date, )

    end 

end
