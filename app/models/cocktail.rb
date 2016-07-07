class Cocktail < ActiveRecord::Base

has_many :doses, dependent: :destroy
validates :name, presence: true, uniqueness: {message: "This cocktail already exists"}
has_many :ingredients, through: :doses

end
