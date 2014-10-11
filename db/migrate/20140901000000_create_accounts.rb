class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name,      null: false
      t.string :subdomain, null: false

      t.index  :name,      unique: true
      t.index  :subdomain, unique: true

      t.timestamps
    end
  end
end
