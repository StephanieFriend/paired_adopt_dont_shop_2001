# frozen_string_literal: true

require 'simplecov'
SimpleCov.start
# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
# Prevent database truncation if the environment is production
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace('gem name')
  config.include Capybara::DSL

  Shoulda::Matchers.configure do |configs|
    configs.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end

  config.before :all do
    Shelter.destroy_all
    Pet.destroy_all
    Review.destroy_all

    @shelter1 = Shelter.create(name: 'Test Name',
                               address: '123 Test Test',
                               city: 'Denver',
                               state: 'CO',
                               zip: '80205')

    @shelter2 = Shelter.create(name: 'Test Paradise',
                               address: 'Test',
                               city: 'Denver',
                               state: 'CO',
                               zip: '80232')

    @pet1 = Pet.create(image: 'https://i.imgur.com/wKls5bM.png',
                        name: 'Test name 1',
                        description: 'Test description 1',
                        age: 'Test age 1',
                        sex: 'Test sex 1',
                        status: 'Adoptable',
                        shelter_id: @shelter1.id)

    @pet2 = Pet.create(image: 'https://i.imgur.com/wKls5bM.png',
                        name: 'Test name 2',
                        description: 'Test description 2',
                        age: 'Test age 2',
                        sex: 'Test sex 2',
                        status: 'Adoptable',
                        shelter_id: @shelter1.id)

    @pet3 = Pet.create(image: 'https://i.imgur.com/wKls5bM.png',
                        name: 'Test name 3',
                        description: 'Test description 3',
                        age: 'Test age 3',
                        sex: 'Test sex 3',
                        status: 'Adoptable',
                        shelter_id: @shelter2.id)

    @pet4 = Pet.create(image: 'https://i.imgur.com/wKls5bM.png',
                        name: 'Test name 4',
                        description: 'Test description 1',
                        age: 'Test age 4',
                        sex: 'Test sex 4',
                        status: 'Adoptable',
                        shelter_id: @shelter2.id)

    @review1 = @shelter1.reviews.create({ title: 'This is Awesome!',
                                          rating: '3',
                                          content: 'Easy process and friendly staff.',
                                          image: 'https://i.imgur.com/wKls5bM.png' })

    @review2 = @shelter1.reviews.create({ title: 'Thank you!',
                                          rating: '4',
                                          content: 'Great selection and reasonable cost.',
                                          image: 'https://lh3.googleusercontent.com/proxy/VH2o2pIhKaUrNNs8PUtOHgayKXVKlaF2lObH0Xmq06RQAu4b4T_U-ZwKqWRd8aSs4-q7WW9-P8JuFPqIvsVwqGMQrL51Q4y7s4GaXx2HZUtYKwYtxlFmwlLH4-aPDkOCMd1lK72FqL75-Viyg_F2NnLs-wypnocyYz0QrEk_f8PDHiZNVIN5WilLHZAir1RFiM617jhlogVQVln6oppZWEWUFk4e7K5CIzJiIbc8LItt6nYmIg' })

    @review3 = @shelter2.reviews.create({ title: 'These guys were ok....ish',
                                          rating: '2',
                                          content: 'Puppies were cool, staff not so much.',
                                          image: 'https://i.redd.it/zz62ggz08k021.jpg' })
  end
end
