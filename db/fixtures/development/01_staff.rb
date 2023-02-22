Staff.seed_once do |s|
  s.id = 1
  s.first_name = '花子'
  s.last_name = '山田'
  s.display_name = 'Hanako'
  s.email = 'hanako@example.com'
  s.password = 'password'
  s.confirmed_at = Time.zone.now
end

Staff.seed_once do |s|
  s.id = 2
  s.first_name = '梅子'
  s.last_name = '松田'
  s.display_name = 'Umeko'
  s.email = 'umeko@example.com'
  s.password = 'password'
  s.confirmed_at = Time.zone.now
end
