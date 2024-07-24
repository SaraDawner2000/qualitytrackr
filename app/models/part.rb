class Part < ApplicationRecord
  has_many :children, foreign_key: :parent_id, class_name: "Subcomponent"
  has_many :parents, foreign_key: :child_id, class_name: "Subcomponent"

  has_many :child_parts, through: :children, source: :child
  has_many :parent_parts, through: :parents, source: :parent
end
