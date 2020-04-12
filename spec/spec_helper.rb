dirs = [
  './app/lib/*.rb',
  './app/lib/graphs/*.rb'
]
dirs.each{|dir| Dir[dir].each {|file| require file }}


RSpec.configure do |config|
  config.filter_run :focus
  config.run_all_when_everything_filtered = true
  config.order = :random

  config.backtrace_exclusion_patterns = [
    /\/lib\d*\/ruby\//,
    /org\/jruby\//,
    /bin\//,
    /lib\/rspec\/(core|expectations|matchers|mocks)/
  ]

  config.default_formatter = "doc" if config.files_to_run.one?
  config.failure_color = :red
  config.tty = true
  config.color = true
end
