# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary server in each group
# is considered to be the first unless any hosts have the primary
# property set.  Don't declare `role :all`, it's a meta role.

role :app, %w{deploy@13.229.240.110}
role :web, %w{deploy@13.229.240.110}
role :db,  %w{deploy@13.229.240.110}


# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server definition into the
# server list. The second argument is a, or duck-types, Hash and is
# used to set extended properties on the server.

#server '13.229.240.110', user: 'deploy', roles: %w{web app}, my_property: :my_value


# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult[net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start).
#
# Global options
# --------------
set :ssh_options, {
  keys: %w(/Users/ryosuke/.ssh/ryosuke),
  forward_agent: false,
  auth_methods: %w(publickey)
}
#
# And/or per server (overrides global)
# ------------------------------------
# server 'ec2-13-229-240-110.ap-southeast-1.compute.amazonaws.com',
#   user: 'deploy',
#   roles: %w{web app db},
#   ssh_options: {
#     user: 'deploy', # overrides user setting above
#     port: 22,
#     keys: %w(/Users/ryosuke/.ssh/ryosuke),
#     forward_agent: false,
#     auth_methods: %w(publickey)
#     # password: 'please use keys'
#   }
