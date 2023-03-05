json.assigned_group_list do
  json.array! @assigned_groups do |cg|
    json.id cg.id
    json.name cg.name
  end
end
json.unassigned_group_list do
  json.array! @unassigned_groups do |cg|
    json.id cg.id
    json.name cg.name
  end
end