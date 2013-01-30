class CreateOrgLists < ActiveRecord::Migration
  def change
    create_table :org_lists do |t|
      t.string :name
      t.string :desc
      t.string :tel

      t.timestamps
    end
  end
end
