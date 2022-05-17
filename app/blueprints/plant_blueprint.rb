class PlantBlueprint < Blueprinter::Base
  identifier :id 

  view :normal do
    fields :created_at, :updated_at
  end
end