case node['tz']
when 'jst'
  execute "Change localtime to JST" do
    command "cp -fa /usr/share/zoneinfo/Japan /etc/localtime"
  end
when 'utc'
  execute "Change localtime to UTC" do
    command "cp -fa /usr/share/zoneinfo/UTC /etc/localtime"
  end
end
