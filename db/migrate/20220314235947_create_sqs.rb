class CreateSqs < ActiveRecord::Migration[6.0]
  def change
    create_table :sqs do |t|
      t.integer :sqtype_id
      t.string :name
      t.string :pic
      t.string :description

      t.timestamps
    end
  end
end
