class CreateSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :skills do |t|
      t.string :description
      #t.references :rol, foreign_key: true
      t.string :resource

      t.timestamps
    end
  end

  #create_table :skills_rols,id:false do |t|  #en vez de una id principal tiene compuestas:
  #  t.belongs_to :rol, index: true
  #  t.belongs_to :skill, index: true
  #end
  create_join_table :skills,:rols do |t|
  end
end
