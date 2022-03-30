class PlantTagsController < ApplicationController
  def new
    @plant = Plant.find params[:plant_id]
    @plant_tag = PlantTag.new
  end

  def create
    @plant = Plant.find params[:plant_id]
    @plant_tag = PlantTag.new(strong_params)
    @plant_tag.plant = @plant
    if @plant_tag.save!
      redirect_to garden_path(@plant.garden.id)
    else
      render :new
    end
  end

  private

  def strong_params
    params.require(:plant_tag).permit(:tag_id)

  end
end
