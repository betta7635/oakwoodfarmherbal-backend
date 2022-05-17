module SeedShares
  def self.new_seed_share(params, current_user)
    seed_share = current_user.seed_share.new(params)
    return ServiceContract.error("Error saving seed!") unless seed_share.save
    ServiceContract.success(seed_share)
  end

  def self.update_seed_share(seed_share_id, params, current_user)
    seed_share = current_user.seed_shares.find(seed_share_id)
    return ServiceContract.error("Error updating seed!") unless seed_share.update(params)
    ServiceContract.success(seed_share)
  end

  def self.destroy_seed_share(seed_share_id, current_user)
    seed_share = current_user.seed_shares.find(seed_share_id)
    ServiceContract.error("Error deleting seed!") and return unless seed_share.destroy
    ServiceContract.success(payload: nil)
  end
end