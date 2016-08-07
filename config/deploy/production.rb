set :stage, :production
server '138.68.62.151', user: 'deploy', roles: %w{web app db}
