class Dose < ActiveRecord::Base
  belongs_to :cocktail
  belongs_to :ingredient

  validates :description, presence: true
  validates :cocktail_id, presence: true
  validates :ingredient_id, presence: { message: "Ingredient missing" }
  validates :ingredient_id, uniqueness: { scope: :cocktail_id, message: "this cocktail already utilizes this ingredient" }


end
