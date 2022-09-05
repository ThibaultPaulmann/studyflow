Rails.application.routes.draw do
  devise_for :users
  root to: "courses#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # get "courses/:course_id/assignments/:assignment_id/forum", to: "questions#index", as: :assignment_questions
  # get "courses/:course_id/assignments/:assignment_id/forum/new", to: "questions#new", as: :new_assignment_question
  post "courses/:course_id/assignments/:assignment_id/forum", to: "questions#create"
  patch "/courses/:course_id/assignments/:assignment_id/forum/", to: "questions#upvote"

  # post "/courses/:course_id/assignments/:assignment_id/forum/:question_id/answers", to: "answers#create", as: :question_answers
  # patch "/courses/:course_id/assignments/:assignment_id/forum/:question_id/answers/:answer_id", to: "answers#update", as: :question_answer

  resources :courses, only: [:index, :show, :new, :create] do
    resources :assignments, only: [:show, :new, :create, :edit, :update] do
      resources :study_sessions, only: [:create]
      resources :questions, only: [:create, :index] do
        resources :answers, only: [:create, :upvote, :update]
      end
    end
  end
  resources :user_assignments, only: [:update]
  resources :course_enrollments, only: [:create]
  resources :study_sessions, only: [:index]
end
