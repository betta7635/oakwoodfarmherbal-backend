class PlanBlueprint < Blueprinter::Base
  identifier :id 
  fields :photoImagePath, :planName, :planLocation, :planDescription, :planNotes, :conservationInfo

  view :normal do
    fields :created_at, :updated_at
  end
end