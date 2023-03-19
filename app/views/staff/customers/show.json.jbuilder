json.customer do
  json.id @customer.id
  json.full_name @customer.full_name
  json.image @customer.image
end

json.training_log_list do
  json.array! @training_logs do |tl|
    json.id tl.id
    json.logged_date tl.logged_date
    json.photo tl.photo
  end
end

json.body_metrics_log_list do
  json.array! @body_metrics_logs do |bl|
    json.id bl.id
    json.logged_date bl.logged_date
    json.photo bl.photo
  end
end