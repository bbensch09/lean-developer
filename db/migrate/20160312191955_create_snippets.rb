class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.string :email
      t.string :body
      t.integer :rating
      t.belongs_to :user, index: true
      t.timestamps null: false
    end
  end
end
