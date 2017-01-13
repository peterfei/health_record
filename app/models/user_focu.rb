class UserFocu < ApplicationRecord
    belongs_to :user

    # def attributes
    #     super.merge(wx_avatar:wx_avatar,vip_mark:vip_mark)
    # end

    # def wx_avatar
    #     self.user.wx_avatar
    # end
    # def vip_mark
    #     self.user.vip_mark
    # end
end
