class WxCode < ApplicationRecord
  enum code_type:[:temporary, :permanent]
  validates :title,:code_type,presence:true
end
