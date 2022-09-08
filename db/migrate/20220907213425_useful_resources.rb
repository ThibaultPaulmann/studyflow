class UsefulResources < ActiveRecord::Migration[7.0]
  def change
    add_column :useful_resources, :name, :string
  end
end
