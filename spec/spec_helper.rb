require 'active_record'
require 'rspec'
require 'shoulda-matchers'

require './lib/employee'
require './lib/project'
require './lib/division'

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))["test"])

RSpec.configure do |config|
  config.after(:each) do
    Employee.all.each { |employee| employee.destroy }
    Project.all.each { |project| project.destroy }
    Division.all.each { |division| division.destroy }
  end
end
