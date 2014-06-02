set :application, 'pocbank'
set :repo_url, "https://unrealhoang:Unreal9!@bitbucket.org/unrealhoang/pocbank.git"
set :branch, 'master'
set :deploy_to, '/home/www/pocbank'
set :scm, :git

set :linked_files, %w{config/database.yml config/application.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets public/uploads}
set :rails_env, "production"
set :rvm_ruby_version, 'ruby-2.1.1'

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# set :deploy_to, '/var/www/my_app'
# set :scm, :git

# set :format, :pretty
# set :log_level, :debug
# set :pty, true

# set :linked_files, %w{config/database.yml}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
# set :keep_releases, 5


before  'deploy:assets:precompile', 'deploy:migrate'
namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
    end
  end

  after :finishing, 'deploy:cleanup'

end
