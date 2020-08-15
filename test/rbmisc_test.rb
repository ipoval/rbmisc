# encoding: utf-8

require "test_helper"

class RbmiscTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Rbmisc::VERSION
    assert ::Rbmisc::VERSION =~ /\A\d+\.\d+\.\d+(\.\d+)?\z/
  end

  def test_log_at_exit_error
    return puts 'FIXME:' + __FILE__

    crash_log = 'rbmisc.crash.log'
    FileUtils.rm crash_log, force: true, verbose: true

    assert self.respond_to?('log_at_exit_error')
    # fails with SystemExit exception'
    assert_false File.exist?(crash_log)
    begin
      fail SystemExit
    rescue SystemExit
      Rbm.send(:dump_error_to_file, crash_log)
    end
    assert_true File.exist?(crash_log)

    FileUtils.rm crash_log, force: true, verbose: true
  end
end
