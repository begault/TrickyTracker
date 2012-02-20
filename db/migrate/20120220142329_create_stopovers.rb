class CreateStopovers < ActiveRecord::Migration
  def change
    create_table :stopovers do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
