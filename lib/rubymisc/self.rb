# encoding: utf-8

# This module encapsulates top level class methods.
module Rubymisc
  class << self
    def log_at_exit_error(log_to)
      at_exit { dump_error_to_file(log_to) }
    end

    def dump_error_to_file(file)
      if $!
        File.open(file, 'a:utf-8:utf-8') do |log|
          error = { timestamp: Time.now,
                    message:   $!.message,
                    backtrace: $!.backtrace,
                    gems:      Gem.loaded_specs.inject({}) { |m, (n, s)| m.merge(n => s.version.to_s) } }
          require 'yaml'
          YAML.dump(error, log)
        end
      end
    end
    private :dump_error_to_file
  end
end
