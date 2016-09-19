require 'rubocop/rake_task'
namespace :rubocop do
  desc 'Run RuboCop'
  RuboCop::RakeTask.new(:run) do |t|
    t.options = ['-D']
  end
end
