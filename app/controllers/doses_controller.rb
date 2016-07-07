class DosesController < ApplicationController

before_action :assign_cocktail, only: [ :new, :create, :destroy ]

def new
  @dose = Dose.new
  @ingredients_list = []
  @ingredients = Ingredient.all
  @ingredients.each do |ingredient|
    @ingredients_list << ingredient.name
  end
end


def create
  if Dose.new(dose_params).valid?
    @dose = Dose.new(dose_params)
    @dose.save
    redirect_to cocktail_path(@cocktail)
  else
    @dose = Dose.new(dose_params)
    render :new
  end
end

def destroy
  @dose = Dose.find(params[:id])
  @dose.destroy
  redirect_to cocktail_path(@cocktail)

end







private

def assign_cocktail
  @cocktail = Cocktail.find(params[:cocktail_id])
end


def dose_params

dose_params = params.require(:dose).permit(:description)
ingredient_name = params.require(:dose).permit(:ingredient)[:ingredient]
ingredient = Ingredient.find_by_name(ingredient_name)
dose_params[:ingredient] = ingredient
dose_params[:cocktail] = @cocktail
return dose_params

end


end
