worker_logfile = File.open("#{Rails.root}/log/health_record.log", 'a')
worker_logfile.sync = true
L =HealthRecordLog.new(worker_logfile)
