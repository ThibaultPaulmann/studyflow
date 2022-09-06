class AddShareCodeToCourse < ActiveRecord::Migration[7.0]
  def change
    add_column :courses, :shareCode, :string
  end
end
