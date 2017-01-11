module API
  module V1
    class HealthItemRecords< Grape::API
        include API::V1::Defaults

        resource :health_item_records do
          params do
            requires :health_item_id, type: Integer, message: "未传health_item_id"
          end
          desc "查询某健康项目记录"
          get :item_records do
            # authenticate!
            @health_item = HealthItem.where("health_item_id = ?", params[:health_item_id])
            @dates = HealthItemRecord.select(:created_at).
              where("health_item_id = ?", params[:health_item_id]).
              group("DATE_FORMAT(created_at,'%Y-%m-%d')")
            @item_records = []
            if @dates.present?
              @dates.each do |d|
                @record = {}
                @date = d.created_at.strftime("%Y-%m-%d")
                @record[:record_date] = @date
                @record[:record_content] = HealthItemRecord.where("health_item_id = ? AND created_at LIKE ?", params[:health_item_id], "%#{@date}%")
                @item_records.push(@record)
              end
            end
            { :health_item=> @health_item, :item_records=> @item_records}
          end

        end

    end
  end
end
