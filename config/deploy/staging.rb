role :app, %w{vagrant@192.168.50.2}
role :web, %w{vagrant@192.168.50.2}

set :rails_env, 'stating'

# set :ssh_options, {
#   # ローカル環境のユーザーの秘密鍵ファイルを設定する
#   keys: %w(/Users/fukui_retu/.ssh/id_rsa)
#   forward_agent: true,
# }
# set :use_sudo, true
