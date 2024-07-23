class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable # :confirmable

  enum roles: { quality_manager: "quality_manager", quality_admin: "quality_admin", qc_tech: "qc_tech", prod_manager: "prod_manager" }
end
