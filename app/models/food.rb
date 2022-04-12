class Food < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :description, presence: true
    validates :price, numericality: {
        only_float: true,
        message: "must be numeric"
    }
    validates :price, numericality: {
        greater_than_or_equal_to: 0.01,
        message: "must more than 0.01"
    }

    def self.by_letter(letter)
        where("name LIKE ?", "#{letter}%").order(:name)
    end
end
