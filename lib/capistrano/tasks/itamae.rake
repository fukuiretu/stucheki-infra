namespace :itamae do
  desc "Server provisioning"
  task :apply do
    on roles(:web), in: :groups, limit: 3 do |host|
      run_locally do
        execute :echo, "Start itamae apply for #{host.hostname}..."
        execute "bundle exec itamae ssh -h #{host.hostname} -u #{host.user} -j itamae/nodes/node.json itamae/recipes/ruby_build.rb"
      end
    end
  end

  desc "Server provisioning dryrun"
  task :dryrun do
    on roles(:web), in: :groups, limit: 3 do |host|
      run_locally do
        execute :echo, "Start itamae provisioning dryrun for #{host.hostname}..."
        execute "bundle exec itamae ssh -h #{host.hostname} -n -u #{host.user} -j itamae/nodes/node.json itamae/recipes/ruby_build.rb"
      end
    end
  end
end
