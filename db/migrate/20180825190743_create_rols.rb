class CreateRols < ActiveRecord::Migration[5.1]
  def change
    create_table :rols do |t|
      t.string :description
     # t.references :skill, foreign_key: true

      t.timestamps
    end
  end
end
