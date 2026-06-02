# Directory for shared resources (PIDs, sockets etc)
app_dir = File.expand_path("../..", __FILE__)
shared_dir = "#{app_dir}/shared"

# Puma can serve each request in a thread from an internal thread pool.
min_threads = ENV.fetch("RAILS_MIN_THREADS", 3)
threads_count = ENV.fetch("RAILS_MAX_THREADS", 3)
threads min_threads, threads_count

environment ENV.fetch("RAILS_ENV", "development")

pidfile "#{shared_dir}/pids/puma.pid"
state_path "#{shared_dir}/pids/puma.state"

if ENV.fetch("RAILS_BIND_TO_SOCKET", false)
  # Bind to Unix socket for nginx reverse proxy
  bind "unix://#{shared_dir}/sockets/puma.sock"
elsif ENV.fetch("RAILS_ENV", "development") == "development"
  bind "tcp://#{ENV.fetch('HOST', '127.0.0.1')}:#{ENV.fetch('PORT', '3000')}"
else
  bind "tcp://#{ENV.fetch('HOST', '0.0.0.0')}:#{ENV.fetch('PORT', '80')}"
end

# Allow puma to be restarted by `bin/rails restart` command.
plugin :tmp_restart
