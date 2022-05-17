module Plans 
  def self.new_plan(params, current_user)
    plan = current_user.plans.new(params)
    return ServiceContract.error("Error saving plan!") unless plan.save
    ServiceContract.success(plan)
  end

  def self.update_plan(plan_id, params, current_user)
    plan = current_user.plans.find(plan_id)
    return ServiceContract.error("Error updating plan!") unless plan.update(params)
    ServiceContract.success(plan)
  end

  def self.destroy_plan(plan_id, current_user)
    plan = current_user.plans.find(plan_id)
    ServiceContract.error("Error deleting plan!") unless plan.destroy
    ServiceContract.success(payload: nil)
  end
end