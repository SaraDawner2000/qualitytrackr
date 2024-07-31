module Cleanable
  extend ActiveSupport::Concern

  included do
    def delete_empty_params(params)
      params.delete_if { |key, value| value == "" }
    end
  end

  class_methods do
  end
end
