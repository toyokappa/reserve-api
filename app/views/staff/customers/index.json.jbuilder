json.customer_list do
  json.array! @customers do |c|
    json.id c.id
    json.full_name c.full_name
    json.image c.image
  end
end