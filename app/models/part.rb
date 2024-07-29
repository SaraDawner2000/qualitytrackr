class Part < ApplicationRecord
  validates :part_number, uniqueness: { scope: :revision, message: "part number of this revision already exists." }

  has_many :quality_projects

  has_many :children, foreign_key: :parent_id, class_name: "Subcomponent"
  has_many :parents, foreign_key: :child_id, class_name: "Subcomponent"

  has_many :child_parts, through: :children, source: :child
  has_many :parent_parts, through: :parents, source: :parent

  scope :top_parts, -> { where.not(id: Subcomponent.pluck(:child_id).uniq) }
  scope :top_parts_with_subcomponents, -> { where(base_material: "subcomponent") }
  scope :subcomponents, -> { where(id: Subcomponent.pluck(:child_id).uniq) }

  def self.ransackable_attributes(auth_object = nil)
    ["part_number", "revision"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["quality_projects"]
  end
end
