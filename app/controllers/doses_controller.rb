class DosesController < ApplicationController

before_action :assign_cocktail, only: [ :new, :create, :destroy ]

def new
  @dose = Dose.new
end


def create

    @dose = Dose.new(dose_params)
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
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

dose_params = params.require(:dose).permit(:description, :ingredient_id)
dose_params[:cocktail] = @cocktail
return dose_params

end


end
