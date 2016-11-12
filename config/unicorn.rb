# set path to application

APP_PATH = "/var/www/server_status/current"
SHARED_PATH = "/var/www/server_status/shared"

working_directory APP_PATH

# Set unicorn options
worker_processes 2
preload_app true
timeout 30

# Set up socket location
listen "#{SHARED_PATH}/sockets/unicorn.sock", :backlog => 64

# Logging
stderr_path "#{SHARED_PATH}/log/unicorn.stderr.log"
stdout_path "#{SHARED_PATH}/log/unicorn.stdout.log"

# Set master PID location
pid "#{SHARED_PATH}/pids/unicorn.pid"
