class TvShow < ApplicationRecord
  has_many :seasons
  has_many :watchlists
  has_many :favorites
  has_many :tv_show_genres
  has_many :genres, through: :tv_show_genres

  def video_url
    s3_client = Aws::S3::Client.new(region: ENV['REGION_CODE'])
    s3_client.presigned_url(:get_object, bucket: ENV['BUCKET_NAME'], key: self.video_key, expires_in: 3000)
  end
end
