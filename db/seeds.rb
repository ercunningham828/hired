require 'faker'

#Remove files and previous uploads for resumes and coverletters
  FileUtils.rm_rf('public/uploads/application/coverletter/')
  FileUtils.rm_rf('public/uploads/application/resume/')

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

  #Create various "posted at" times for the jobs
    jobs=Job.all
    jobs.each do |job|
      job.update_attributes!(created_at: rand(1.days .. 20.days).ago)
      job.save!
    end 

 # Create Applications
applications=[
 daenerys=Application.new(
  name:"Daenerys Targaryen",
  email: "motherofdragons@gmail.com",
  phone: Faker::PhoneNumber.cell_phone,
  job: ruler
  ),

 joff=Application.new(
  name:"Joffrey Baratheon",
  email: "kingjoffrey@kingslanding.com",
  phone: Faker::PhoneNumber.cell_phone,
  job: ruler
  ),

  stannis=Application.new(
  name:"Stannis Baratheon",
  email: "stantheman@hotmail.com",
  phone: Faker::PhoneNumber.cell_phone,
  job: ruler
  ),

  ned=Application.new(
  name:"Eddard Stark",
  email: "winteriscoming@yahoo.com",
  phone: Faker::PhoneNumber.cell_phone,
  job: member
  ),

 samwell=Application.new(
  name:"Samwell Tarly",
  email: "samtheslayer@gmail.com",
  phone: Faker::PhoneNumber.cell_phone,
  job: member
  ),

roose=Application.new(
  name:"Roose Bolton",
  email: "roose@flayedman.com",
  phone: Faker::PhoneNumber.cell_phone,
  job: warden
  ),

theon=Application.new(
  name:"Theon Greyjoy",
  email: "reek@sbcglobal.net",
  phone: Faker::PhoneNumber.cell_phone,
  job: warden
  ),

jon=Application.new(
  name:"Jon Snow",
  email: "youknownothing@nightswatch.com",
  phone: Faker::PhoneNumber.cell_phone,
  job: commander
  ),

janos=Application.new(
  name:"Janos Slynt",
  email: "janos@nightswatch.com",
  phone: Faker::PhoneNumber.cell_phone,
  job: commander
  ),

bowen=Application.new(
  name:"Bowen Marsh",
  email: "bowen@nightswatch.com",
  phone: Faker::PhoneNumber.cell_phone,
  job: commander
  )]

#Update time applied for and status randomly
status=["New Application","Under Review","Rejected","Hired"]
applications.each do |app|
  resume=File.open(File.join(Rails.root, 'public/uploads/GOTResume.pdf'))
  coverletter=File.open(File.join(Rails.root, 'public/uploads/GOTCoverLetter.pdf'))
  app.update_attributes!(created_at: rand(10.minutes .. 6.days).ago, phone:Faker::PhoneNumber.cell_phone,status:status.sample,resume:resume,coverletter:coverletter)
  app.save!
end

 puts "Seed finished"
 puts "#{Job.count} jobs created"
 puts "#{Application.count} applications created"