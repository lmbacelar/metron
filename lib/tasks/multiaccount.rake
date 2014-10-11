db_tasks = %w[db:migrate db:migrate:up db:migrate:down db:rollback db:forward]

namespace :multiaccount do
  db_tasks.each do |task_name|
    desc "Run #{task_name} for each account"
    task task_name => %w[environment db:load_config] do
      if Account.connection.tables.any?
        Account.find_each do |account|
          puts "Running #{task_name} for account #{account.name} (#{account.subdomain})"
          account.scope_schema { Rake::Task[task_name].execute }
        end
      end
    end
  end
end

db_tasks.each do |task_name|
  Rake::Task[task_name].enhance(["multiaccount:#{task_name}"])
end
