role :app, %w{ec2-user@ec2-54-65-97-179.ap-northeast-1.compute.amazonaws.com}
role :web, %w{ec2-user@ec2-54-65-97-179.ap-northeast-1.compute.amazonaws.com}

set :ssh_options, {
  keys: "~/.ssh/aws-r82.pem"
}
set :rails_env, "production"
set :itamae_web_recipe, "itamae/recipes/web.rb"
set :itamae_node, "itamae/nodes/node.json"
