ActiveAdmin.register Employer do

  permit_params :profile, :name, :about, :vision, :website, :facebook_link, :twitter_link, :youtube_link, :instagram_link, :google_plus_link, :linkedin_link, :published_at

  scope :all
  scope :published
  scope :unpublished

  action_item :view, only: :show do
    link_to 'View on site', employer_path(employer) if employer.published_at?
  end

  action_item :publish, only: :show do
    link_to "Publish", publish_admin_employer_path(employer), method: :put if !employer.published_at?
  end

  action_item :unpublish, only: :show do
    link_to "Unpublish", unpublish_admin_employer_path(employer), method: :put if employer.published_at?
  end

  member_action :publish, method: :put do
    employer = Employer.find(params[:id])
    employer.update(published_at: Time.zone.now)
    redirect_to admin_employer_path(employer)
  end

  member_action :unpublish, method: :put do
    employer = Employer.find(params[:id])
    employer.update(published_at: nil)
    redirect_to admin_employer_path(employer)
  end

end
