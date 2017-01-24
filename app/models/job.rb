class Job < ApplicationRecord
  belongs_to :employer
  belongs_to :job_category
  belongs_to :job_type

  geocoded_by :location
  after_validation :geocode

  scope :published, ->{ where.not(published_at: nil)}
  scope :unpublished, ->{ where(published_at: nil)}

  validates :exclusive, presence: false
  validates :employer, presence: false
  validates :job_category, presence: false
  validates :job_type, presence: false
  validates :title, presence: false
  validates :content, presence: false
  validates :location, presence: false
  validates :apply_date, presence: false
  validates :apply_info, presence: false
  validates :contact_info, presence: false
  validates :published_at, presence: false

  def self.search(params)
  if params[:job_category] and params[:job_type].present?
    jobs = Job.where(job_category_id: params[:job_category].to_i, job_type_id: params[:job_type].to_i)
    jobs = jobs.where("title like ? or content like ?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
    jobs = jobs.near(params[:location], 20) if params[:location].present?
  else
    jobs = Job.where("title like ? or content like ?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
  end
  jobs
end
end
