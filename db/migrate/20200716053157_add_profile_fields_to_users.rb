class AddProfileFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string
    add_index :users, :username, unique: true
    add_column :users, :image, :string
    add_column :users, :bio, :text

    add_column :babies, :image, :string
    add_column :assistants, :image, :string
    add_column :activities, :image, :string
  end
end
