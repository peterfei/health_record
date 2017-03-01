namespace :base_data do
  desc '健康项目数据初始化'
  task :health_item => :environment do
    puts '*********开始初始化健康项目基础数据**********'
    ###默认项
    health_item = HealthItem.find_or_create_by(name:'血压',unit:'mmHg',user_id:nil,is_admin:1,normal_min:30,normal_max:200,value_range:'60,140',icon:'icon-xieya',icon_bgcolor:'#4bd964')
    HealthItemSub.find_or_create_by(name:'高压',sub_unit:'mmHg',sub_max:200,sub_min:30,health_item_id:health_item.id,sub_value_range:'90,140')
    HealthItemSub.find_or_create_by(name:'低压',sub_unit:'mmHg',sub_max:200,sub_min:30,health_item_id:health_item.id,sub_value_range:'60,90')
    HealthItemSub.find_or_create_by(name:'心率',sub_unit:'次／日',sub_max:200,sub_min:30,health_item_id:health_item.id,sub_value_range:'60,100')
    puts "#{health_item.name}数据初始化完成*********"
    healt_item = HealthItem.find_or_create_by(name:'空腹血糖',unit:'mmol/L',user_id:nil,is_admin:1,normal_min:3.9,normal_max:6.1,value_range:'0.0,20.0',icon:'icon-xietangzhi',icon_bgcolor:'#ff3b30')
    puts "#{healt_item.name}数据初始化完成**********"
    healt_item = HealthItem.find_or_create_by(name:'体温',unit:'°C',user_id:nil,is_admin:1,normal_min:36.0,normal_max:37.0,value_range:'34.0,42.0',icon:'icon-wenduji',icon_bgcolor:'#ff3b30')
    puts "#{healt_item.name}数据初始化完成**********"
    healt_item = HealthItem.find_or_create_by(name:'体重',unit:'kg',user_id:nil,is_admin:1,normal_min:50,normal_max:70,value_range:'30,200',icon:'icon-icontizhong01',icon_bgcolor:'#ff3b30')
    puts "#{healt_item.name}数据初始化完成**********"
    ###隐藏项
    #TODO 隐藏项目暂无图标
    healt_item = HealthItem.find_or_create_by(name:'血红蛋白',unit:'g/L',user_id:nil,is_check:0,is_admin:1,normal_min:110,normal_max:160,value_range:'0,300',icon:'icon-icontizhong01',icon_bgcolor:'#ff3b30')
    puts "#{healt_item.name}(隐藏项)数据初始化完成**********"
    healt_item = HealthItem.find_or_create_by(name:'胆固醇',unit:'mmol/L',user_id:nil,is_check:0,is_admin:1,normal_min:3.1,normal_max:6.2,value_range:'0.0,30.0',icon:'icon-icontizhong01',icon_bgcolor:'#ff3b30')
    puts "#{healt_item.name}(隐藏项)数据初始化完成**********"
    healt_item = HealthItem.find_or_create_by(name:'甘油三酯',unit:'mmol/L',user_id:nil,is_check:0,is_admin:1,normal_min:0.56,normal_max:1.71,value_range:'0.00,10.00',icon:'icon-icontizhong01',icon_bgcolor:'#ff3b30')
    puts "#{healt_item.name}(隐藏项)数据初始化完成**********"
    healt_item = HealthItem.find_or_create_by(name:'体重指数',unit:'',user_id:nil,is_check:0,is_admin:1,normal_min:18.5,normal_max:25,value_range:'5,50',icon:'icon-icontizhong01',icon_bgcolor:'#ff3b30')
    puts "#{healt_item.name}(隐藏项)数据初始化完成**********"
    healt_item = HealthItem.find_or_create_by(name:'白细胞数',unit:'10^9/L',user_id:nil,is_check:0,is_admin:1,normal_min:4.0,normal_max:10.0,value_range:'0.0,30.0',icon:'icon-icontizhong01',icon_bgcolor:'#ff3b30')
    puts "#{healt_item.name}(隐藏项)数据初始化完成**********"
    healt_item = HealthItem.find_or_create_by(name:'血小板数',unit:'10^9/L',user_id:nil,is_check:0,is_admin:1,normal_min:100,normal_max:300,value_range:'0,1000',icon:'icon-icontizhong01',icon_bgcolor:'#ff3b30')
    puts "#{healt_item.name}(隐藏项)数据初始化完成**********"
    healt_item = HealthItem.find_or_create_by(name:'丙氨酸氨基转氨酶',unit:'U/L',user_id:nil,is_check:0,is_admin:1,normal_min:5,normal_max:40,value_range:'0,200',icon:'icon-icontizhong01',icon_bgcolor:'#ff3b30')
    puts "#{healt_item.name}(隐藏项)数据初始化完成**********"


  end

  desc '初始化数据'
  task :all=>[:health_item]
end
