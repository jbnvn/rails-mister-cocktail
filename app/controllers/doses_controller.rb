class DosesController < ApplicationController
  before_action :set_dose, only: [:show, :edit, :update, :destroy]

  def index
    @doses = Dose.all
  end

  def show
  end

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(doses_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save!
      redirect_to cocktail_path(@dose.cocktail_id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @dose.update(doses_params)
    # redirect_to doses_path(@dose)
  end

  def destroy
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail_id)
  end

  private

  def doses_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def set_dose
    @dose = Dose.find(params[:id])
  end
end
