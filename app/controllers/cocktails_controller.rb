class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :destroy, :delete_photo, :update_photo]

  def index
    @cocktails = Cocktail.all
  end

  def show
  end

  def destroy
    @cocktail.destroy
    redirect_to root_path, method: :get
  end

   def delete_photo
    @cocktail.photo.purge
    redirect_to cocktail_path(@cocktail)
  end

  def update_photo
    if @cocktail.update(cocktail_params)
      redirect_to cocktail_path(@cocktail)
    else
      render :show
    end
  end

  def new
    @cocktail = Cocktail.new
    @dose = Dose.new
    @ingredients = Ingredient.all
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
