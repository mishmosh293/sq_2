class AddSqtypeReferenceToSqs < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :sqs, :sq_types, column: :sqtype_id
    add_index :sqs, :sqtype_id
    change_column_null :sqs, :sqtype_id, false
  end
end
