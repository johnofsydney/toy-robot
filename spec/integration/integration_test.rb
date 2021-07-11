# frozen_string_literal: true

require_relative '../../src/conductor'

result = Conductor.start
expected_result = '0,0,SOUTH'

success = result == expected_result ? 'success' : 'failure'

p "Result of integration test: #{success}"
