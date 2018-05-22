class ChangeTrapIdType < ActiveRecord::Migration[5.2]
  def change
    change_column :request_models, :trap_id, :string
  end
end
