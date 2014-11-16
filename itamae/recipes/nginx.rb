package "nginx"

remote_file "/etc/nginx/conf.d/stucheki.conf" do
  source "remote_files/stucheki.conf"
  notifies :reload, "service[nginx]"
end

service "nginx" do
  action :start
  not_if "pgrep nginx"
end
