# encoding: utf-8

require 'spec_helper'

describe Rbm do
  describe '.log_at_exit_error' do
    let(:crash_log) { 'rubymisc.crash.log' }

    around(:each) { FileUtils.rm crash_log, force: true, verbose: true }

    it { should respond_to :log_at_exit_error }

    specify 'fail SystemExit, raised by exit to initiate the termination of the script' do
      File.exist?(crash_log).should be_false

      begin
        fail SystemExit
      rescue Exception
        Rbm.send(:dump_error_to_file, crash_log)
      end

      File.exist?(crash_log).should be_true
    end
  end
end
