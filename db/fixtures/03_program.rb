Program.seed_once do |p|
  p.id = 1
  p.name = '無料カウンセリング'
  p.required_time = 60
  p.description = ''
  p.required_ticket = 0
  p.publish_target = 2
  p.use_limit = 1
end

Program.seed_once do |p|
  p.id = 2
  p.name = 'パーソナルトレーニング'
  p.required_time = 60
  p.description = 'ご利用にはチケットが必要となります。'
  p.required_ticket = 1
  p.publish_target = 1
  p.use_limit = nil
end
