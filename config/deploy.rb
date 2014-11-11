# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'stucheki'
set :repo_url, 'https://github.com/fukuiretu/stucheki.git'
set :deploy_to, '/home/vagrant/app/stucheki'
set :scm, :git
set :keep_releases, 3
set :pty, true
# set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
# set :unicorn_pid, "#{shared_path}/tmp/pids/unicorn.pid"

namespace :deploy do
  application = fetch :application
  deploy_to = fetch :deploy_to

  desc 'Bundle install'
  after :publishing, :bundle_install do
    on roles(:app), in: :sequence, wait: 5 do
      execute "cd #{deploy_to}/current; bundle install --path vendor/bundle;"
    end
  end
  # after :publishing, :restart

  # desc 'Restart application'
  # after :bundle_install, :unicor_restart do
  #   on roles(:app), in: :groups, limit: 3, wait: 10 do
  #     invoke 'unicorn:restart'
  #   end
  # end
end
