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
   task :seeds => :environment do
     Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].each do |filename|
       task_name = File.basename(filename, '.rb')
       puts "seeding - #{task_name}"
       load(filename)
     end
   end
 end

desc "Update status campaign to finished"
  namespace :task do
    task :campaign => :environment do
      puts "**********"
      puts "Data Campaign Selesai || Tanggal #{DateTime.now}"
      campaign = Patient.where(status: "accepted")
      campaign.map do |patient|
          if !patient.validated_at.blank? || !patient.period.blank?
            if patient.period == 0 
              patient.update(status: "finished")
              puts patient.name
            end
          end
      end
      puts "**********"
    end
  end
