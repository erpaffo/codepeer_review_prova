class CreateActivities < ActiveRecord::Migration[7.1]
  def change
    create_table :activities do |t|
      t.string :action
      t.references :user, null: false, foreign_key: true
      t.references :trackable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
