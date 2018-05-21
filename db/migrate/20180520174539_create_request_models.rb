class CreateRequestModels < ActiveRecord::Migration[5.2]
  def change
    create_table :request_models do |t|
      t.datetime :request_date
      t.string :remote_ip
      t.string :request_method
      t.string :scheme_request
      t.string :query_string
      t.string :query_params
      t.string :cookies
      t.string :headers
      t.integer :trap_id

      t.timestamps
    end
  end
end
