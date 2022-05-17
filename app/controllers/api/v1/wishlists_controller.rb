module Api 
  module V1 
    class WishlistsController < Api::V1::ApplicationController
    private
      def wishlist_params
        params.require(:info).permit(:primaryCommonName, :photoImagePath, :formattedScientificName, :color, :duration, :source, :description, :uses, :conservationInfo, :notes, :amount)
      end

      # POST/api/v1/wishlists
      def create
        result = Wishlists.new_wishlist(wishlist_params, @current_user)
        render_error(errors: "There was a problem creating a new wishlist item.", status: 400) and return unless result.success?
        payload = {
          wishlist: WishlistBlueprint.render_as_hash(result.payload),
        }
        render_success(payload: payload)
      end
      
      # PATCH/PUT/api/v1/wishlists/:id
      def update
        result = Wishlists.update_wishlist(params[:id], wishlist_params, @current_user)
        render_error(errors: "There was a problem updating this wishlist item.", status: 400) and return unless result.success?
        payload = {
          wishlist: WishlistBlueprint.render_as_hash(result.payload),
        }
        render_success(payload: payload)
      end
      
      # DELETE/api/v1/wishlists:id
      def destroy
        result = Wishlists.destroy_wishlist(params[:id], @current_user)
        render_error(errors: "There was a problem deleting this wishlist item.", status: 400) and return unless result.success?
        render_success(payload: nil)
      end
      
      # GET current_user
      def my_wishlists
        render_success(payload: WishlistBlueprint.render_as_hash(@current_user.wishlists))
      end
    end
  end
end