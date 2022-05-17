module Api 
  module V1 
    class PlantsController < Api::V1::ApplicationController
    private
      def plant_params
        params.require(:info).permit(:primaryCommonName, :photoImagePath, :formattedScientificName, :color, :duration, :source, :description, :uses, :conservationInfo, :notes, :amount)
      end

      # POST/api/v1/plants
      def create
        result = Plants.new_plant(plant_params, @current_user)
        render_error(errors: "There was a problem creating a new plant.", status: 400) and return unless result.success?
        payload = {
          plant: PlantBlueprint.render_as_hash(result.payload),
        }
        render_success(payload: payload)
      end
      
      # PATCH/PUT/api/v1/plants/:id
      def update
        result = Plants.update_plant(params[:id], plant_params, @current_user)
        render_error(errors: "There was a problem updating this plant.", status: 400) and return unless result.success?
        payload = {
          plant: PlantBlueprint.render_as_hash(result.payload),
        }
        render_success(payload: payload)
      end
      
      # DELETE/api/v1/plants:id
      def destroy
        result = Plants.destroy_plant(params[:id], @current_user)
        render_error(errors: "There was a problem deleting this plant.", status: 400) and return unless result.success?
        render_success(payload: nil)
      end
      
      # GET current_user
      def my_plants
        render_success(payload: PlantBlueprint.render_as_hash(@current_user.plants))
      end
    end
  end
end