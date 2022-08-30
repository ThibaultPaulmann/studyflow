# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
emails = ["philipp@glasmacher.com", "olayinkatimothy102@gmail.com", "thibault.paulmann@gmail.com", "123@gmail.com", "example@example.com"]


puts 'Creating courses...'

course = ""
user = ""
assignment = ""
question = ""
answer = ""
registered_assignment = ""

emails.each do |email|
  user = User.new(email: email, password: email, firstName: Faker::Name.first_name, lastName: Faker::Name.last_name)
  user.save
end

10.times do
  course = Course.new(name: Faker::Educator.subject, code: rand(101..207))
  course.save
end


15.times do
  assignment = Assignment.new(course: Course.all.sample, due_date: Time.now, title: Faker::Book.title)
  assignment.save
end

15.times do
  user_assignment = User.assignment.new(assignment: Assignment.all.sample, user: User.all.sample, user_progress: UserAssignment::PROGRESS.sample)
  user_assignment.save
end

course_enrollment = CourseEnrollment.new()
course_enrollment.save

  question = Question.new(name: Faker::Educator.subject, code: rand(101..207))
  question.save


  answer = Answer.new(name: Faker::Educator.subject, code: rand(101..207))
  answer.save

end

puts 'Done!'
