set :stage, :staging

# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary
# server in each group is considered to be the first
# unless any hosts have the primary property set.
server '128.199.193.72', 
  user: 'unreal', 
  roles: %w{web app db},
  ssh_options: {
    user: 'unreal',
    port: '1020',
    forward_agent: true,
  }
