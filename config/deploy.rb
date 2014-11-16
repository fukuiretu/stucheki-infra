# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'stucheki'
set :repo_url, 'git@github.com:fukuiretu/stucheki.git'
set :scm, :git
set :keep_releases, 3
set :pty, true
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
set :deploy_to, '/var/www/app/stucheki'

namespace :deploy do
  application = fetch :application
  deploy_to = fetch :deploy_to

  desc 'Bundle install'
  after :publishing, :bundle_install do
    on roles(:app), in: :sequence, wait: 5 do
      execute "cd #{deploy_to}/current; bundle install --path vendor/bundle;"
    end
  end
end
