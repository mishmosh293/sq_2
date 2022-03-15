class SqResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :sqtype_id, :integer
  attribute :name, :string
  attribute :pic, :string
  attribute :description, :string

  # Direct associations

  # Indirect associations

end
