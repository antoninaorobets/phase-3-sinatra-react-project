require 'faker'
puts "🌱 Seeding spices..."

# Seed your database here
#  Faker::Name.first_name  
user1 = User.create(name: Faker::Name.first_name)
user2 = User.create(name: Faker::Name.first_name)
job1 = Job.create(job_info("3006454906"))
job2 = Job.create(job_info("2945627033"))
job3 = Job.create(job_info("3088556355"))
job4 = Job.create(job_info("3056881003"))
Application.create(user: user1, job: job2, status: "applied")
Application.create(user: user1, job: job3, status: "applied")
Application.create(user: user1, job: job4, status: "decliened")
Application.create(user: user2, job: job1, status: "in process")
Application.create(user: user2, job: job2, status: "applied")
Application.create(user: user2, job: job3, status: "applied")

puts "✅ Done seeding!"

#  Application.create(user_id: 1, job_id: 3, status: "applied")