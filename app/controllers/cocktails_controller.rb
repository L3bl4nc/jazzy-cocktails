class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(required_params)
    @cocktail.save

    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end
  
  private

  def required_params
    params.require(:cocktail).permit(:name, photos: [])
  end
end
