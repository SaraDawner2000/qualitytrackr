class QualityProject < ApplicationRecord
  enum customer_approval: { not_ready: "not_ready", ready: "ready", sent: "sent", approved: "approved", rejected: "rejected" }
  enum customers: { sparky: "sparky", mctracktor: "mctracktor" }

  belongs_to :part

  def self.ransackable_attributes(auth_object = nil)
    ["part_id", "part_number", "assembled_record", "customer", "customer_approval", "id", "inspection_plan", "customer_request"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["part"]
  end
end
