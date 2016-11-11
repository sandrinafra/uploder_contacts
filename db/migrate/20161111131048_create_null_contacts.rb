class CreateNullContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :null_contacts do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :status
      t.belongs_to :import, foreign_key: true

      t.timestamps
    end
  end
end
