task :default => [:specs, 'cukes-domain', 'cukes-web-ui']
desc "run the specs"
task "specs" do
  sh "rspec --color"
end

desc "run the cukes with the domain driver"
task "cukes-domain" do
  sh "DOMAIN=1 cucumber -f progress"
end

desc "run the cukes with the web ui driver"
task "cukes-web-ui" do
  sh "cucumber -f progress"
end

