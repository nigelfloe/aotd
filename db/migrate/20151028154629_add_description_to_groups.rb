class AddDescriptionToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :description, :text, default: "no description given"
  end
end
