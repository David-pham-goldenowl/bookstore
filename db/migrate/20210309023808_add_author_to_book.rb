class AddAuthorToBook < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :author_id, :integer
    add_index :books, :author_id
  end
end
