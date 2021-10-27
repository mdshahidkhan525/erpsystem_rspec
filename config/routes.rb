Rails.application.routes.draw do
  resources :students
  root 'home#index'
  get 'home/about'
  get 'home/result'

  devise_for :admins
  resources :faculties
  
  # faculty  login and functionality
  get "faculty/login", to: "faculties#login"
  get "faculty/dashboard", to: "faculties#dashboard"
  post "faculty/is_login", to: "faculties#is_login"
  get "view/profile", to: "faculties#profile"
  get "add/assignment", to:"faculties#addassignment"
  get "faculty/signout", to: "faculties#signout"
  #student result handle here
  get "result/publish",to: "results#publish"
  get "result/check_marks",to:"results#check_marks"


  post "result/marksinsert", to: "results#marksinsert"
  post "result/assign",to: "results#assign"

  get "search/student", to: "faculties#search"
  get "student/details", to: "faculties#studentsdetails"
  post "faculty/students_details", to: "faculties#students_details"

  # Student login and functionality
  get "student/login", to: "students#login"
  get "student/dashboard", to: "students#dashboard"
  post "student/is_login", to: "students#is_login"

  get "student/signout", to: "students#signout"

  get "student/list", to:"faculties#list"
  get "student/assignment",to: "students#assignments"
  get "student/result", to:"students#resultsearch"
  get "student/result_details", to:"students#studentresult"
  post "student/result_details", to:"students#result_details"

  get "view/student/profile", to: "students#profile"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
