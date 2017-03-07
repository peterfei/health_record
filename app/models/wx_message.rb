class WxMessage < ApplicationRecord
  enum type:[:news]
  mount_uploader :pic_url, WxUploader
end
