class PlantsController < ApplicationController

# NESTED RESSOURCES
  def new
    # FIND THE PARENT
    @garden = Garden.find params[:garden_id]

    # Create a empty child (que l'on va utiliser pour remplir avec le formulaire)
    @plant = Plant.new
  end

  def create
    @plant = Plant.new(strong_params)

    # Because its nested
    @garden = Garden.find params[:garden_id]

    # On doit associer le @garden qui correcpond à la @plant que l'on crée
    @plant.garden = @garden

    if @plant.save
      redirect_to garden_path(@garden)
    else
      render :new
    end
  end

  def destroy
    # on vient séléctionner la plante à detruite
    @plant = Plant.find params[:id]
    # on la détruit
    @plant.destroy

    redirect_to garden_path(@plant.garden.id)

  end

  private

  def strong_params
    params.require(:plant).permit(:name, :photo_url)
  end
end
