class AddUrlToOrgLists < ActiveRecord::Migration
  def change
    add_column :org_lists, :url, :string
  end
end
