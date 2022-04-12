class Food < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :price, presence: true, numericality: true

    def self.by_letter(letter)
        where("name LIKE ?", "#{letter}%").order(:name)
    end
end
