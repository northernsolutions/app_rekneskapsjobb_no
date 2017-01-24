class AddSummaryToEmployer < ActiveRecord::Migration[5.0]
  def change
    add_column :employers, :summary, :text
  end
end
