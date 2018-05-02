class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :account
      t.string :email
      t.string :nickname

      t.timestamps
    end
  end
end
