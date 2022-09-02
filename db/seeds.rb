# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
emails = ["philipp@glasmacher.com", "olayinkatimothy102@gmail.com", "thibault.paulmann@gmail.com", "123@gmail.com", "example@example.com"]

puts 'Creating all seeded files...'


emails.each do |email|
  user = User.new(email: email, password: email, firstName: Faker::Name.first_name, lastName: Faker::Name.last_name)
  user.save
end
puts "created users"

10.times do
  course = Course.new(name: Faker::Educator.subject, code: rand(101..207))
  course.save
end
puts "created courses"

15.times do
  assignment = Assignment.new(course: Course.all.sample, due_date: (DateTime.now + rand(1..10).days), title: Faker::Book.title)
  assignment.save
end
puts "created asignments"

15.times do
  user_assignment = UserAssignment.new(assignment: Assignment.all.sample, user: User.all.sample, user_progress: UserAssignment::PROGRESS.sample)
  user_assignment.save
end
puts "created user_assignments"
10.times do
  course_enrollment = CourseEnrollment.new(user: User.all.sample, course: Course.all.sample)
  course_enrollment.save
end
puts "created course enrollments"
15.times do
  question = Question.new(assignment: Assignment.all.sample, user: User.all.sample, title: Faker::Book.title)
  question.save
end
puts "created questions"
15.times do
  answer = Answer.new(question: Question.all.sample, user: User.all.sample, content: Faker::Science.science)
  answer.save
end
puts "created answers"
puts 'Done!'
