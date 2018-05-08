# Change to match your CPU core count
workers 4
threads_count = 5
# Min and Max threads per worker
threads threads_count, threads_count

worker_timeout 300
rackup DefaultRackup
port 8082
#default to production
rails_env = ENV["RAILS_ENV"]
environment rails_env
