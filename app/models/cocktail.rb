class Cocktail < ActiveRecord::Base

has_many :doses, dependent: :destroy
validates :name, presence: true, uniqueness: true
has_many :ingredients, through: :doses

end
