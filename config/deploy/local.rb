set :application, "invoicer.rails"
set :repository,  "git://github.com/slaxor/invoicer.rails.git"
set :scm, :git
role :web, "127.0.0.1"                          # Your HTTP server, Apache/etc
role :app, "127.0.0.1"                          # This may be the same as your `Web` server
role :db,  "127.0.0.1", :primary => true # This is where Rails migrations will run
set :deploy_to, File.join("", "opt", application)
set :local_shared_files, %w(config/database.yml)
set :local_shared_dirs, %w(log tmp)
set :use_sudo, false
ssh_options[:username] = ENV['USER']

after "deploy:migrations", "deploy:cleanup"

#desc "link in production database configuration"
#task :after_update_code, :roles => [:app] do
  #run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
#end



