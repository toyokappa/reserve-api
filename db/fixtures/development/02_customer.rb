Customer.seed_once do |c|
  c.id = 1
  c.first_name = '太郎'
  c.last_name = '田中'
  c.first_name_kana = 'たろう'
  c.last_name_kana = 'たなか'
  c.email = 'tanaka@example.com'
  c.birthday = Date.new(1990, 1, 1)
  c.tel = '080-1234-1234'
  c.postcode = '377-0221'
  c.address = '群馬県前橋市樋越町123-4'
  c.password = 'password'
  c.confirmed_at = Time.zone.now
end
