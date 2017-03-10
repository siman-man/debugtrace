require 'debugtrace/version'

module Debugtrace
  module BacktraceWithArguments
    def set_backtrace(errinfo)
      debugtrace = errinfo.zip(backtrace_locations).map do |msg, bl|
        key = "#{bl.path}:#{bl.label}"
        [msg, Debugtrace.stack[key].pop].join(' ')
      end

      super(debugtrace)
    end
  end
end

class Exception
  prepend Debugtrace::BacktraceWithArguments
end

module Debugtrace
  @stack = Hash.new { |h, k| h[k] = [] }
  STACK_LIMIT = 100

  def self.stack
    @stack
  end

  TracePoint.trace(:call) do |tp|
    key = "#{tp.path}:#{tp.method_id}"

    arg_names = tp.defined_class.instance_method(tp.method_id).parameters.map { |n| n[1] }.compact
    arguments = arg_names.map { |name| [name, tp.binding.local_variable_get(name)] }.to_h

    @stack[key] << { arguments: arguments }
    @stack[key].shift if @stack[key].size > STACK_LIMIT
  end
end
