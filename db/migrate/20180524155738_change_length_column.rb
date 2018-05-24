class ChangeLengthColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :request_models, :cookies, :text
    change_column :request_models, :headers, :text
  end
end
