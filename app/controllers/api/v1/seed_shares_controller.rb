module Api 
  module V1 
    class SeedSharesController < Api::V1::ApplicationController
    private
      def seed_share_params
        params.require(:info).permit(:primaryCommonName, :photoImagePath, :formattedScientificName, :color, :duration, :source, :description, :uses, :conservationInfo, :notes, :amount)
      end
      
      # POST/api/v1/seed_shares
      def create
        result = SeedShares.new_seed_share(seed_share_params, @current_user)
        render_error(errors: "There was a problem creating a new seed.", status: 400) and return unless result.success?
        payload = {
          seed_share: SeedShareBlueprint.render_as_hash(result.payload),
        }
        render_success(payload: payload)
      end
      
      # PATCH/PUT/api/v1/seed_shares/:id
      def update
        result = SeedShare.update_seed_share(params[:id], seed_share_params, @current_user)
        render_error(errors: "There was a problem updating this seed.", status: 400) and return unless result.success?
        payload = {
          seed_share: SeedShareBlueprint.render_as_hash(result.payload),
        }
        render_success(payload: payload)
      end
      
      # DELETE/api/v1/seed_shares:id
      def destroy
        result = SeedShare.destroy_seed_share(params[:id], @current_user)
        render_error(errors: "There was a problem deleting this seed.", status: 400) and return unless result.success?
        render_success(payload: nil)
      end
     
      # GET current_user
      def my_seed_shares
        render_success(payload: SeedShareBlueprint.render_as_hash(@current_user.seed_shares))
      end
    end
  end
end