class AddTitleToIdeas < ActiveRecord::Migration[5.2]
  def change
    add_column :ideas, :title, :string
  end
end
