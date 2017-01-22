ActiveAdmin.register Job do

  permit_params :exclusive, :employer_id, :job_category_id, :job_type_id, :title, :content, :location, :apply_date, :apply_info, :contact_info, :published_at

  action_item :view, only: :show do
    link_to 'View on site', job_path(job) if job.published_at?
  end

  action_item :publish, only: :show do
    link_to "Publish", publish_admin_job_path(job), method: :put if !job.published_at?
  end

  action_item :unpublish, only: :show do
    link_to "Unpublish", unpublish_admin_job_path(job), method: :put if job.published_at?
  end

  member_action :publish, method: :put do
    job = Job.find(params[:id])
    job.update(published_at: Time.zone.now)
    redirect_to admin_job_path(job)
  end

  member_action :unpublish, method: :put do
    job = Job.find(params[:id])
    job.update(published_at: nil)
    redirect_to admin_job_path(job)
  end

end
