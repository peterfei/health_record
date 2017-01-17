module API
  module V1
    class HealthItemRecords< Grape::API
        include API::V1::Defaults
        include Grape::Kaminari
        
        resource :health_item_records do
          desc "查询某健康项目记录"
          params do
            requires :health_item_id, type: Integer, message: "未传health_item_id"
          end
          get :item_records do
            # authenticate!
            @health_item = HealthItem.find(params[:health_item_id])
            @health_item_subs = @health_item.health_item_subs rescue nil
            @all_dates = HealthItemRecord.select(:created_at).
              where("health_item_id = ?", params[:health_item_id]).
              group("DATE_FORMAT(created_at,'%Y-%m-%d')")
            @dates = paginate(@all_dates)
            @item_records = []
            if @dates.present?
              @dates.each do |d|
                @record = {}
                @date = d.created_at.strftime("%Y-%m-%d")
                @record[:record_date] = @date
                @contents = HealthItemRecord.where("health_item_id = ? AND created_at LIKE ?", params[:health_item_id], "%#{@date}%")
                if @health_item_subs.present?
                  @record[:record_content] = []
                  @contents.each do |c|
                    @temp = {}
                    @temp[:subitem_time] = c.created_at.strftime('%H:%M')
                    @subitem = []
                    @subitem_contents = c.content.split(",") rescue nil
                    @subitem_contents.each_with_index do |subitem_content, index|
                      @content = {}
                      @content[:name] = @health_item_subs[index].name
                      @content[:content] = subitem_content
                      if @health_item_subs[index].sub_max.present?
                        if subitem_content.to_f>@health_item_subs[index].sub_max
                          @content[:ex_max] = 1
                        else
                          @content[:ex_max] = 0
                        end
                      elsif @health_item.normal_max.present?
                        if subitem_content.to_f>@health_item.normal_max
                          @content[:ex_max] = 1
                        else
                          @content[:ex_max] = 0
                        end
                      else
                        @content[:ex_max] = 0
                      end
                      if @health_item_subs[index].sub_min.present?
                        if subitem_content.to_f<@health_item_subs[index].sub_min
                          @content[:ex_min] = 1
                        else
                          @content[:ex_min] = 0
                        end
                      elsif @health_item.normal_min.present?
                        if subitem_content.to_f<@health_item.normal_min
                          @content[:ex_min] = 1
                        else
                          @content[:ex_min] = 0
                        end
                      else
                        @content[:ex_min] = 0
                      end
                      @subitem.push(@content)
                    end
                    @temp[:subitem_content] = @subitem
                    @record[:record_content].push(@temp)
                  end
                else
                  @record[:record_content] = []
                  @contents.each do |c|
                    @content = {}
                    @content[:created_at] = c.created_at.strftime('%H:%M')
                    @content[:name] = @health_item.name
                    @content[:content] = c.content
                    if @health_item.normal_max.present?
                      if c.content>@health_item.normal_max
                        @content[:ex_max] = 1
                      else
                        @content[:ex_max] = 0
                      end
                    else
                      @content[:ex_max] = 0
                    end
                    if @health_item.normal_min.present?
                      if c.content<@health_item.normal_min
                        @content[:ex_min] = 1
                      else
                        @content[:ex_min] = 0
                      end
                    else
                      @content[:ex_min] = 0
                    end
                    @record[:record_content].push(@content)
                  end
                end
                
                @item_records.push(@record)
              end
            end
            { :health_item=> @health_item, :item_records=> @item_records }
          end

        end

    end
  end
end
