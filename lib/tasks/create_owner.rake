desc "Add owner to database"
task add_owner: :environment do
  Journalist.create(:first_name => "Micheal", :last_name => "The Owner", :email => "micheal@email.com", :password => "admin1234", :owner => true)
  puts "Micheal's account is successfully created."
end
