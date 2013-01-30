class AddViewsToOrgLists < ActiveRecord::Migration
  def change
    add_column :org_lists, :views, :integer
  end
end
