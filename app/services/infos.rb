module Infos
  def self.new_info(params, current_user)
    info = current_user.infos.new(params)
    return ServiceContract.error("Error saving info!") unless info.save
    ServiceContract.success(info)
  end

  def self.update_info(info_id, params, current_user)
    info = current_user.infos.find(info_id)
    return ServiceContract.error("Error updating info!") unless info.update(params)
    ServiceContract.success(info)
  end

  def self.destroy_info(info_id, current_user)
    info = current_user.infos.find(info_id)
    ServiceContract.error("Error deleting info!") and return unless info.destroy
    ServiceContract.success(payload: nil)
  end
end