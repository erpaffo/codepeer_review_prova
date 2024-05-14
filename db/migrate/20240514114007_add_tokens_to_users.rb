class AddTokensToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :github_token, :string
    add_column :users, :gitlab_token, :string
  end
end
