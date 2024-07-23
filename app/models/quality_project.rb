class QualityProject < ApplicationRecord
  enum customer_approval: { not_ready: "not_ready", ready: "ready", sent: "sent", approved: "approved", rejected: "rejected" }

  belongs_to :part
end
