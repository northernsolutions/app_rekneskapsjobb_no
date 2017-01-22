class CreateEmployers < ActiveRecord::Migration[5.0]
  def change
    create_table :employers do |t|
      t.boolean :profile
      t.string :name
      t.text :about
      t.text :vision
      t.string :website_link
      t.string :facebook_link
      t.string :twitter_link
      t.string :youtube_link
      t.string :instagram_link
      t.string :google_plus_link
      t.string :linkedin_link

      t.timestamps
    end
  end
end
