json.customer do
  json.id @customer.id
  json.full_name @customer.full_name
  json.image @customer.image
end
json.assigned_group_list do
  json.array! @assign_groups do |cg|
    json.id cg.id
    json.name cg.name
  end
end
json.unassigned_group_list do
  json.array! @unassign_groups do |cg|
    json.id cg.id
    json.name cg.name
  end
end