# frozen_string_literal: true

# Extend JSON std library

require 'json'

def JSON.valid?(string)
  !!JSON.parse(string)
rescue JSON::ParserError
  false
end
