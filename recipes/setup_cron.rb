#
# Cookbook Name:: import_ean_data
# Recipe:: setup_cron
#
# Copyright 2014, Groople, LLC
#
# All rights reserved - Do Not Redistribute
#
#
node[:deploy].each do |app_name, deploy|
  next if deploy[:application_type] != "rails"

  cron "import_ean_data" do
    minute "0"
    hour "1"
    command "cd #{deploy[:deploy_to]}/current/docs/scripts && PARAM_MYSQL_USER=#{deploy[:database][:username]} PARAM_MYSQL_PASS=#{deploy[:database][:password]} PARAM_MYSQL_HOST=#{deploy[:database][:password]} PARAM_MYSQL_DB=#{deploy[:database][:database]} PARAM_HOME_DIR=/home/ubuntu ./EAN_MySQL_refresh.sh"
  end
end
