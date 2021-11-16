class AddEquipmentCategoryToOffers < ActiveRecord::Migration[6.1]
  def change
    add_column :offers, :equipment_category, :string
  end
end
