ActiveAdmin.register Employer do

  permit_params :profile, :name, :about, :vision, :website, :facebook_link, :twitter_link, :youtube_link, :instagram_link, :google_plus_link, :linkedin_link, :published_at

end
