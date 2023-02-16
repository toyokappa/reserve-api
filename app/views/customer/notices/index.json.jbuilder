json.notice_list do
  json.array! @notices do |notice|
    json.type notice[:type]
    json.title notice[:title]
    json.description notice[:description]
  end
end