class Subcomponent < ApplicationRecord
  belongs_to :parent, class_name: "Part"
  belongs_to :child, class_name: "Part"
end
