class InfoBlueprint < Blueprinter::Base
  identifier :id 
  fields :primaryCommonName, :photoImagePath, :formattedScientificName, :color, :duration, :source, :description, :uses, :conservationInfo, :notes, :amount

  view :normal do
    fields :created_at, :updated_at
  end
end