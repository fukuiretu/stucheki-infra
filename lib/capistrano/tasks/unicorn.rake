namespace :unicorn do
  task :enviroment do
    set :unicorn_pid, "#{shared_path}/tmp/pids/unicorn.pid"
    set :unicorn_config, "#{current_path}/config/unicorn.rb"
  end

  def send_signal(signal)
    execute :kill, "-s #{signal} $(< #{fetch :unicorn_pid})"
  end

  def start_unicorn
    within current_path do
      with bundle_gemfile: "#{current_path}/Gemfile" do
        # execute :bundle, :exec, :unicorn, "-c #{fetch :unicorn_config} -E #{fetch :rails_env} -D"
        execute :bundle, :exec, :unicorn, "-c #{fetch :unicorn_config} -D"
      end
    end
  end

  def stop_unicorn
    send_signal('QUIT')
  end

  desc 'Restart unicorn server gracefully'
  task restart: :enviroment do
    on roles(:app) do
      if test(" [ -f #{fetch :unicorn_pid} ]")
        send_signal('USR2')
      else
        start_unicorn
      end
    end
  end

  # task :restart do
  #   on roles(:app) do
  #     execute :echo, "Restart unicorn server gracefully"
  #   end
  # end
end

after 'deploy:finishing', 'unicorn:restart'
