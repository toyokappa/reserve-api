CarrierWave.configure do |config|
  if Rails.env.in? %w[production]
    config.storage = :fog
    config.fog_credentials = {
      provider: "AWS",
      use_iam_profile: true,
      region: "ap-northeast-1",
      path_style: true,
    }
    config.fog_public = false
    config.fog_directory = "sympl-reserve-api-#{Rails.env}-uploads"
    config.asset_host = "https://api.sympl.jp" # TODO: 後で変数に戻す
  else
    config.storage = :file
    config.asset_host = 'http://localhost:7777'
  end
end