class CreateUsefulResources < ActiveRecord::Migration[7.0]
  def change
    create_table :useful_resources do |t|
      t.text :link
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
