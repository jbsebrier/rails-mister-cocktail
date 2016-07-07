class CocktailsController < ApplicationController

def index
@cocktails = Cocktail.all
end

def show
  @cocktail = Cocktail.find(params[:id])
  @doses = @cocktail.doses
end

def new
  @cocktail = Cocktail.new
end

def create
  if Cocktail.new(cocktail_params).valid? == true
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save
    redirect_to cocktail_path(@cocktail)
  else
    @cocktail = Cocktail.new(cocktail_params)
    render :new
  end


end




private

def cocktail_params
params.require(:cocktail).permit(:name)
end




end