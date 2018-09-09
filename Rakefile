require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList['test/test*.rb']
  t.ruby_opts = ['-W0'] # warnings level 0
end

desc 'Run tests'
task default: :test
