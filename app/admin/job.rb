ActiveAdmin.register Job do

  permit_params :exclusive, :employer_id, :job_category_id, :job_type_id, :title, :content, :location, :apply_date, :apply_info, :contact_info, :published_at

end
