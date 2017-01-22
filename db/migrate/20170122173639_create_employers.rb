class CreateEmployers < ActiveRecord::Migration[5.0]
  def change
    create_table :employers do |t|
      t.boolean :profile
      t.string :name
      t.text :about
      t.text :vision
      t.string :website
      t.string :facebook
      t.string :twitter
      t.string :youtube
      t.string :instagram
      t.string :google_plus
      t.string :linkedin_string

      t.timestamps
    end
  end
end
