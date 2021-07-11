# frozen_string_literal: true
# rubocop:disable all
require 'pry'


root = './'
Dir[File.join(root, 'src', '**/*.rb')].each { |file| require file }

result = Conductor.start
expected_result = '0,0,SOUTH'

success = result == expected_result ? 'success' : 'failure'

p "Result of integration test: #{success}"

