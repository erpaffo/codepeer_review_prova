class CreateSnippets < ActiveRecord::Migration[7.1]
  def change
    create_table :snippets do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :code
      t.string :language

      t.timestamps
    end
  end
end
