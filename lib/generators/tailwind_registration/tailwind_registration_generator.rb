require 'rails/generators/base'

class TailwindRegistrationGenerator < Rails::Generators::Base
  source_root File.expand_path("templates", __dir__)
  
  desc "Creates the default sign up views and controller for built in rails authentication"
  def create_signup_controller_and_views
    route "resource :registrations, only: [:new, :create]"
    copy_file "registrations_controller.rb", "app/controllers/registrations_controller.rb"
    directory "registrations", "app/views/registrations"
    insert_into_file "app/views/sessions/new.html.erb", before: '<div class="mt-4 text-sm text-gray-500 sm:mt-0">' do
      "<%= link_to 'Sign Up', new_registrations_path, class: 'px-3 py-2 rounded-lg border-2 border-gray-900 text-gray-900 hover:bg-gray-900 hover:text-gray-50 transition duration-250' %>"
    end
  end
end