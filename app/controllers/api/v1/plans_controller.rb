module Api 
  module V1 
    class PlansController < Api::V1::ApplicationController
    private
      def plan_params
        params.require(:plan).permit(:photoImagePath, :planName, :planLocation, :planDescription, :planNotes, :conservationInfo)
      end  

      # POST/api/v1/plans
      def create
        result = Plans.new_plan(plan_params, @current_user)
        render_error(errors: "There was a problem creating a new plan.", status: 400) and return unless result.success?
        payload = {
          plan: PlanBlueprint.render_as_hash(result.payload),
        }
        render_success(payload: payload)
      end

      # PATCH/PUT/api/v1/plans/:id
      def update
        result = Plans.update_plan(params[:id], plan_params, @current_user)
        render_error(errors: "There was a problem updating this plan.", status: 400) and return unless result.success?
        payload = {
          plan: PlanBlueprint.render_as_hash(result.payload),
        }
        render_success(payload: payload)
      end

      # DELETE/api/v1/plans:id
      def destroy
        result = Plans.destroy_plan(params[:id], @current_user)
        render_error(errors: "There was a problem deleting this plan.", status: 400) and return unless result.success?
        render_error(payload: nil)
      end
      
      # GET current_user
      def my_plans
        render_success(payload: PlanBlueprint.render_as_hash(@current_user.plans))
      end
    end
  end
end