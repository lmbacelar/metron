class CreateInstruments < ActiveRecord::Migration
  def change
    create_table :instruments do |t|
      t.string :reference,    null: false   
      t.string :description,  null: false
      t.string :manufacturer
      t.string :model
      t.string :sn
      t.string :pn
      t.string :remarks

      t.index  :reference, unique: true

      t.timestamps
    end
  end
end
