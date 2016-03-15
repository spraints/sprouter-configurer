class CreateRoutingRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :routing_requests do |t|
      t.string :ip, index: true
      t.string :requested_mode
      t.string :requested_by
      t.datetime :until

      t.timestamps
    end
  end
end
