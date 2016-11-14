namespace :remote_rake do
  desc "Invoke rake task"
  task :invoke do
    on roles(:app) do
      within "#{current_path}" do
        with rails_env: fetch(:rails_env) do
          execute :rake, ENV['task']
        end
      end
    end
  end
end
