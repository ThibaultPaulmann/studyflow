module NavigationHelper
  def navigation_history(resource, action = nil)
    links = [link_to('Home', root_path)]
    if resource.is_a?(Assignment) && action == :questions
      links << link_to_resource(resource.course)
      links << link_to_resource(resource)
      links << link_to_resource(resource, action)
    elsif resource.is_a? Assignment
      links << link_to_resource(resource.course)
      links << link_to_resource(resource)
    elsif resource.is_a? Course
      links << link_to_resource(resource)
    elsif resource == :study_sessions
      links << link_to("Study Sessions", study_sessions_path)
    elsif resource == :course_new
      links << link_to("Create a Course", new_course_path)
    elsif resource == :course_enrollment_new
      links << link_to("Join a Course", new_course_enrollment_path)
    end

    links.join(' > ').html_safe
  end

  def link_to_resource(resource, action = nil)
    if resource.is_a? Course
      link_to resource.name, course_path(resource)
    elsif resource.is_a?(Assignment) && action == :questions
      link_to "Forum", course_assignment_questions_path(resource.course, resource)
    elsif resource.is_a? Assignment
      link_to resource.title, course_assignment_path(resource.course, resource)
    end
  end
end
