class CreateAttendances < ActiveRecord::Migration[7.0]
  def change
    create_table :attendances do |t|
      t.string :stripe_customer_id
      t.references :customer, index: true
      t.belongs_to :event

      t.timestamps
    end
  end
end
