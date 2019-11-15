class Ingredient < ApplicationRecord
  has_many :doses
  validates :name, presence: true, uniqueness: true
  # before_destroy :check_for_cocktail

  # private

  # def check_for_cocktail
  #   if cocktails.count > 0
  #     false
  #   end
  # end
end
