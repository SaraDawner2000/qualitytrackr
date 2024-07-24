class ChangeReferencesOnSubcomponentsTable < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key "subcomponents", "users", column: "child_id"
    remove_foreign_key "subcomponents", "users", column: "parent_id"

    add_foreign_key "subcomponents", "parts", column: "child_id"
    add_foreign_key "subcomponents", "parts", column: "parent_id"
  end
end
