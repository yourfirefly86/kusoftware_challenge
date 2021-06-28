class CreateInputs < ActiveRecord::Migration[6.1]
  def change
    create_table :inputs do |t|
      t.text :email
      t.text :firstname
      t.text :lastname
      t.text :language
      t.integer :proficiency

      t.timestamps
    end
  end
end
