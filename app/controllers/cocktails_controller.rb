class CocktailsController < ApplicationController

def index
@cocktails = Cocktail.all
@cocktail = Cocktail.new
end

def show
  @cocktail = Cocktail.find(params[:id])
  @doses = @cocktail.doses
  @ingredients_list = []
  @ingredients = Ingredient.all
  @ingredients.each do |ingredient|
    @ingredients_list << ingredient.name
  end
  @dose = Dose.new
end

def new
  @cocktail = Cocktail.new
end

def create
    @cocktails = Cocktail.all
    @cocktail = Cocktail.new(cocktail_params)
  if @cocktail.save
    redirect_to cocktail_path(@cocktail)
  else
    render :index
  end


end




private

def cocktail_params
params.require(:cocktail).permit(:name)
end




end
