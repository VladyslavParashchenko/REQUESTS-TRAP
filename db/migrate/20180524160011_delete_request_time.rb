class DeleteRequestTime < ActiveRecord::Migration[5.2]
  def change
    remove_column :request_models, :request_date
  end
end
