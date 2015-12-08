S3DirectUpload.config do |c|
  c.access_key_id = ENV['S3_ACCESS_KEY_ID']         # your access key id
  c.secret_access_key = ENV['S3_SECRET_ACCESS_KEY'] # your secret access key
  c.bucket = ENV['S3_BUCKET']                       # your bucket name
  c.region = ENV['S3_REGION']                       # region prefix of your bucket url. This is _required_ for the non-default AWS region, eg. "s3-eu-west-1"
  c.url = ENV['S3_URL']                             # S3 API endpoint (optional), eg. "https://#{c.bucket}.s3.amazonaws.com/"
end
