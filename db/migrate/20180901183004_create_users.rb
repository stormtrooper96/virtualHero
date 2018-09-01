class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :avatar
      t.string :email
      t.string :state
      t.datetime :registrationdate
      t.string :password_digest
      t.references :rol, foreign_key: true

      t.timestamps
    end
  end
end
