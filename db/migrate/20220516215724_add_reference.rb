class AddReference < ActiveRecord::Migration[6.1]
  def change
    add_reference :info, :wishlist, null: true, foreign_key: true
  end
end
