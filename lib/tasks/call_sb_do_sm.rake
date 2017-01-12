namespace :call_sb_do_sm do
  desc '提醒吃药'
  task :reminding_medicine => :environment do
    @take_medicine_attention = TakeMedicineAttention.where(:medicine_attention_time => Time.now.strftime('%H:%M'))
    if @take_medicine_attention.empty?
      L.info "无需要提醒项目#{Time.now.strftime('%Y-%m-%d %H:%M')}"
    else
      L.info "开始获取需提醒用户及项目"
      template = YAML.load(File.read("#{Rails.public_path}/tem.yml"))
      @take_medicine_attention.each do |m|
        begin
          # {wx_id:m.take_medicine_management.user.wx_id,
          #  key1:m.take_medicine_management.name,
          #  key2:"#{m.take_medicine_management.usage}次/日 #{m.take_medicine_management.dosage}片/次",
          #  key3:m.medicine_attention_time
          # }
          template['template']['data']['key1']['value'] = m.take_medicine_management.name
          template['template']['data']['key2']['value'] = "#{m.take_medicine_management.usage}次/日 #{m.take_medicine_management.dosage}片/次"
          template['template']['data']['key3']['value'] = m.medicine_attention_time
          Wechat.api.template_message_send Wechat::Message.to(m.take_medicine_management.user.wx_id).template(template['template'])
        rescue Exception=> e
          L.debug "****推送提醒异常#{e.to_json}**未推送用户#{m.take_medicine_management.user.id}__#{m.take_medicine_management.user.wx_id}***"
        end
      end

    end





  end

  desc '测试数据更改提醒时间'
  task :change_time => :environment do
    TakeMedicineManagement.where(:user_id => 2).each do |m|
      m.take_medicine_attentions.first.update_attribute(:medicine_attention_time,Time.now.strftime('%H:%M')) unless m.take_medicine_attentions.empty?
    end
  end
end
