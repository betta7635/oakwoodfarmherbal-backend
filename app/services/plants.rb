module Plants
  def self.new_plant(params, current_user)
    plant = current_user.plants.new(params)
    return ServiceContract.error("Error saving plant!") unless plant.save
    ServiceContract.success(plant)
  end

  def self.update_plant(plant_id, params, current_user)
    plant = current_user.plants.find(plant_id)
    return ServiceContract.error("Error updating plant!") unless plant.update(params)
    ServiceContract.success(plant)
  end

  def self.destroy_plant(plant_id, current_user)
    plant = current_user.plants.find(plant_id)
    ServiceContract.error("Error deleting plant!") and return unless plant.destroy
    ServiceContract.success(payload: nil)
  end
end