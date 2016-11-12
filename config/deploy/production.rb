set :stage, :production
server '54.82.251.241', user: 'rails', roles: %w{app db web}
set :ssh_options, {
                    forward_agent: true,
                    auth_methods: %w(publickey)
                }
