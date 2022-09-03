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

8.times do
  course = Course.new(name: Faker::Educator.course_name.truncate(17), code: rand(101..207))
  course.save!

  users = User.all.sample(3)
  users.each do |user|
    CourseEnrollment.create!(user: user, course: course)
  end
  puts "created enrollments"

  5.times do
    assignment = Assignment.new(course: course, due_date: (DateTime.now + rand(-2..5).days), title: Faker::Book.title.truncate(43))
    assignment.save!

    course.users.each do |user|
      UserAssignment.create!(assignment: assignment, user: user, user_progress: UserAssignment::PROGRESS.sample)
    end

    course.users.each do |user|
      question = Question.new(assignment: assignment, user: user, title: Faker::Book.title)
      question.save
    end
    puts "created questions"

    Answer.create!(question: assignment.questions.sample, user: course.users.sample, content: Faker::Science.science)
    puts "created answer"
  end
  puts "created assignments and userAssignments"
end
puts "created courses and enrollments"
puts 'Done!'
