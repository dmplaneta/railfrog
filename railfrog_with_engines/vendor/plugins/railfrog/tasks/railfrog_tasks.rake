# desc "Explaining what the task does"
# task :railfrog do
#   # Task goes here
# end

namespace :railfrog do
  desc "Sync extra files from railfrog plugin."
  task :sync do
    system "rsync -ruv vendor/plugins/railfrog/db/migrate db"
    system "rsync -ruv vendor/plugins/railfrog/public ."
    system "rsync -ruv vendor/plugins/railfrog/lang ."
    system "rsync -ruv vendor/plugins/railfrog/util ."
  end
end