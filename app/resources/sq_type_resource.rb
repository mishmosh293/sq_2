class SqTypeResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :description, :string

  # Direct associations

  has_many   :sqs,
             foreign_key: :sqtype_id

  # Indirect associations

end
