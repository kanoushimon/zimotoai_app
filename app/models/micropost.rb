class Micropost < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true
  validates :image,   content_type: { in: %w[image/jpeg image/gif image/png],
                                      message: "jpeg、png、もしくはgifのファイルをアップロードしてください。" },
                      size:         { less_than: 20.megabytes,
                                      message: "ファイルの最大容量は20MBです。" }

  def display_image
    image.variant(resize_to_limit: [500, 500])
  end
end
