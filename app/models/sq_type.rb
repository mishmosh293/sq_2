class SqType < ApplicationRecord
  # Direct associations

  has_many   :sqs,
             foreign_key: "sqtype_id",
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end
end
