class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :username
      t.string :token
      t.string :email
      t.string :image
      t.string :followers
      t.string :following
      t.string :repos
      t.string :public_repos
      t.string :starred
      t.string :name

      t.timestamps
    end
  end
end


