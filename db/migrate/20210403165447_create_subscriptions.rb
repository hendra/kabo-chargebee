class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.string :chargebee_customer_id
      t.date :date

      t.timestamps
    end
  end
end
