require 'faker'

# Create Admin user
    admin = Admin.new(
     email:    "admin@example.com",
     password: "helloworld",
   )
   admin.save!
 
 # Create Ruler of Westeros Job
  ruler=Job.create!(
     title:  "Ruler of Westeros",
     description:   Faker::Lorem.paragraph
   )
  # Create Member of Nights Watch Job
   member=Job.create!(
     title:  "Member of the Night's Watch",
     description:   Faker::Lorem.paragraph
   )

  #Create Warden of North Job
    warden=Job.create!(
     title:  "Warden of the North",
     description:   Faker::Lorem.paragraph
   )

  #Create Lord Commander
    commander=Job.create!(
     title:  "Lord Commander of the Night's Watch",
     description:   Faker::Lorem.paragraph
   )


 
 # Create Applications

 daenerys=Application.create!(
  name:"Daenerys Targaryen",
  email: "motherofdragons@gmail.com",
  phone: Faker::PhoneNumber.cell_phone,
  job: ruler
  )

 joff=Application.create!(
  name:"Joffrey Baratheon",
  email: "kingjoffrey@kingslanding.com",
  phone: Faker::PhoneNumber.cell_phone,
  job: ruler
  )

  stannis=Application.create!(
  name:"Stannis Baratheon",
  email: "stantheman@hotmail.com",
  phone: Faker::PhoneNumber.cell_phone,
  job: ruler
  )

  ned=Application.create!(
  name:"Eddard Stark",
  email: "winteriscoming@yahoo.com",
  phone: Faker::PhoneNumber.cell_phone,
  job: member
  )

 samwell=Application.create!(
  name:"Samwell Tarly",
  email: "samtheslayer@gmail.com",
  phone: Faker::PhoneNumber.cell_phone,
  job: member
  )

roose=Application.create!(
  name:"Roose Bolton",
  email: "roose@flayedman.com",
  phone: Faker::PhoneNumber.cell_phone,
  job: warden
  )

theon=Application.create!(
  name:"Theon Greyjoy",
  email: "reek@sbcglobal.net",
  phone: Faker::PhoneNumber.cell_phone,
  job: warden
  )

jon=Application.create!(
  name:"Jon Snow",
  email: "youknownothing@nightswatch.com",
  phone: Faker::PhoneNumber.cell_phone,
  job: commander
  )

janos=Application.create!(
  name:"Janos Slynt",
  email: "janos@nightswatch.com",
  phone: Faker::PhoneNumber.cell_phone,
  job: commander
  )

bowen=Application.create!(
  name:"Bowen Marsh",
  email: "bowen@nightswatch.com",
  phone: Faker::PhoneNumber.cell_phone,
  job: commander
  )

applications=Application.all
#Update time applied for and status randomly
status=["New Application","Under Review","Rejected","Hired"]
applications.each do |app|
  app.update_attributes!(created_at: rand(10.minutes .. 6.days).ago, phone:Faker::PhoneNumber.cell_phone,status:status.sample)
  app.save!
end

 puts "Seed finished"
 puts "#{Job.count} jobs created"
 puts "#{Application.count} applications created"