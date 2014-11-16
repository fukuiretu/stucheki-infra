package "epel-release"
package "gcc-c++"

%w(timezone nginx ruby_build).each do |recipe|
  include_recipe "#{recipe}.rb"
end
