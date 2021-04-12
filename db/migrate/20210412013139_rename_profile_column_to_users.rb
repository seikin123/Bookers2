class RenameProfileColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :profile, :introduction

  end
end
