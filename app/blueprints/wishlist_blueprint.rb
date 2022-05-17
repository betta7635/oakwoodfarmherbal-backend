class WishlistBlueprint < Bluprinter::Base
  identifer :id 

  view :normal do
    fields :created_at, :updated_at
  end
end