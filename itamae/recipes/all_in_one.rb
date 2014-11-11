include_recipe "yum-repl.rb"
include_recipe "git.rb"
# include_recipe "timezone.rb"
# include_recipe "nginx.rb"
# include_recipe "mysql.rb"
include_recipe "ruby_build.rb"

# %w(yum-repl git timezone nginx mysql rbenv).each do |recipe|
#   include_recipe "#{recipe}.rb"
# end
