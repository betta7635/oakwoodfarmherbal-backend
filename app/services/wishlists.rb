module Wishlists
  def self.new_wishlist(params, current_user)
    wishlist = current_user.wishlists.new(params)
    return ServiceContract.error("Error saving wishlist!") unless wishlist.save
    ServiceContract.success(wishlist)
  end

  def self.update_wishlist(wishlist_id, params, current_user)
    wishlist = current_user.wishlists.find(wishlist_id)
    return ServiceContract.error("Error updating wishlist!") unless wishlist.update(params)
    ServiceContract.success(wishlist)
  end

  def self.destroy_wishlist(wishlist_id, current_user)
    wishlist = current_user.wishlists.find(wishlist_id)
    ServiceContract.error("Error deleting wishlist!") and return unless wishlist.destroy
    ServiceContract.success(payload: nil)
  end
end