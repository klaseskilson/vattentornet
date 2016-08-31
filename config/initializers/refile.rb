require 'refile/s3'

aws = {
  access_key_id: ENV['AWS_ACCESS_KEY_ID'],
  secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
  region: ENV['AWS_REGION'],
  bucket: ENV['AWS_S3_BUCKET']
}
Refile.cache = Refile::S3.new(prefix: 'cache', **aws)
Refile.store = Refile::S3.new(prefix: 'store', **aws)

Refile.cdn_host = ENV['CDN_HOST'] unless Rails.env.development?
