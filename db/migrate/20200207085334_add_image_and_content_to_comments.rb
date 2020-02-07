class AddImageAndContentToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :picture, :string
    add_column :comments, :content, :string
  end
end
