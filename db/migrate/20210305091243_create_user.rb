class CreateUser < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string  :first_name
      t.string  :last_name
      t.string  :email
      t.string  :title
      t.string  :avatar
      t.string  :gender
      t.numeric  :age
      t.string  :role
      
      t.timestamps
    end
  end
end
