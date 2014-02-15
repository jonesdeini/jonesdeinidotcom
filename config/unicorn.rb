# set path to app that will be used to configure unicorn,
# note the trailing slash in this example
@dir = "/home/jonesdeinidotcom/current/"

worker_processes 2
working_directory @dir

timeout 30

# Specify path to socket unicorn listens to,
# we will use this in our nginx.conf later
listen "#{@dir}tmp/unicorn.sock", :backlog => 64

# Set process id path
pid "#{@dir}tmp/pids"

# Set log file paths
@log_path = "#{@dir}log"
stderr_path "#{@log_path}"
stdout_path "#{@log_path}"
