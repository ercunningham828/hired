module TestFactories
  FactoryGirl.define do
   factory :admin do
     email "admin@example.com"
     password "helloworld"
   end

   factory :application do
     name "Test Applicant"
     email "test@gmail.com"
     phone "111-111-111"
     job { Job.create(title: 'New Job') }
   end

    factory :job do
     title "Post Title"
     description "This is where the job description usually goes. They have to be at least fifty characters."
   end
  end
end