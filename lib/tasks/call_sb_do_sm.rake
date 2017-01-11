namespace :call_sb_do_sm do
  desc '提醒吃药'
  task :reminding_medicine => :environment do
    wechat_api

  end
end
