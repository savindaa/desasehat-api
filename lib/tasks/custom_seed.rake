namespace :db do
  namespace :seed do
    Dir[Rails.root.join('db', 'seeds', '*.rb')].each do |filename|
      task_name = File.basename(filename, '.rb')
      desc "Seed " + task_name + ", based on the file with the same name in `db/seeds/*.rb`"
      task task_name.to_sym => :environment do
        load(filename) if File.exist?(filename)
      end
    end
  end
end

desc "Run all files in db/seeds directory"
 namespace :db do
   task seeds: :environment do
     Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].each do |filename|
       task_name = File.basename(filename, '.rb')
       puts "seeding - #{task_name}"
       load(filename)
     end
   end
 end
