# package "http://dev.mysql.com/get/mysql-community-release-el6-5.noarch.rpm"

package "mysql"
package "mysql-devel"
package "mysql-server"
package "mysql-utilities"

service "mysqld" do
  action :restart
end
