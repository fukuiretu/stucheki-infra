namespace :itamae do

  desc "Server provisioning"
  task :apply do
    on roles(:web), in: :groups, limit: 3 do |host|
      run_locally do
        ssh = fetch :ssh_options
        ssh_key = ssh[:keys]
        recipe = fetch :itamae_web_recipe
        node = fetch :itamae_node

        execute :echo, "Start itamae apply for #{host.hostname}..."
        execute "bundle exec itamae ssh -h #{host.hostname} -i #{ssh_key} -u #{host.user} -j #{node} #{recipe}"
      end
    end
  end

  desc "Server provisioning dryrun"
  task :dryrun do
    on roles(:web), in: :groups, limit: 3 do |host|
      run_locally do
        ssh = fetch :ssh_options
        ssh_key = ssh[:keys]

        execute :echo, "Start itamae provisioning dryrun for #{host.hostname}..."
        execute "bundle exec itamae ssh -h #{host.hostname} -i #{ssh_key} -n -u #{host.user} -j itamae/nodes/node.json itamae/recipes/web.rb"
      end
    end
  end
end
