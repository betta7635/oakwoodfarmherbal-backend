module Api 
  module V1 
    class InfosController < Api::V1::ApplicationController
    private
      def info_params
        params.require(:info).permit(:primaryCommonName, :photoImagePath, :formattedScientificName, :color, :duration, :source, :description, :uses, :conservationInfo, :notes, :amount)
      end

      # POST/api/v1/infos
      def create
        result = Infos.new_info(info_params, @current_user)
        render_error(errors: "There was a problem creating new info.", status: 400) and return unless result.success?
        payload = {
          info: InfoBlueprint.render_as_hash(result.payload),
        }
        render_success(payload: payload)
      end
      
      # PATCH/PUT/api/v1/infos/:id
      def update
        result = Infos.update_info(params[:id], info_params, @current_user)
        render_error(errors: "There was a problem updating this info.", status: 400) and return unless result.success?
        payload = {
          info: InfoBlueprint.render_as_hash(result.payload),
        }
        render.success(payload: payload)
      end
      
      # DELETE/api/v1/infos:id
      def destroy
        result = Infos.destroy_info(params[:id], @current_user)
        render_error(errors: "There was a problem deleting this info.", status: 400) and return unless result.success?
        render.success(payload: nil)
      end
    end
  end
end