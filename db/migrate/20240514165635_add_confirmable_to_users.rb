class AddConfirmableToUsers < ActiveRecord::Migration[6.0]
  # Note: You can't use change, as User.update_all will fail in the down migration
  def up
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_sent_at, :datetime
    add_column :users, :unconfirmed_email, :string # Only if using reconfirmable
    add_index :users, :confirmation_token, unique: true

    # Allow null encrypted_password
    change_column_null :users, :encrypted_password, true

    # Update all existing users as confirmed
    User.update_all confirmed_at: DateTime.now
  end

  def down
    remove_columns :users, :confirmation_token, :confirmed_at, :confirmation_sent_at, :unconfirmed_email
    # change_column_null :users, :encrypted_password, false
  end
end
