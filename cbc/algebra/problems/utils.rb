require 'rubygems'
ENC_NONE=nil
require 'sourcify'
require 'matrix'
require 'tablizer'

def check(val, *args, &fun)
  table = Tablizer::Table.new([["Function", "Arguments", "Result", "Matches"]], header: true)

  result = fun.call(*args)

  truth = if val.is_a?(Numeric)
            (result - val.to_f).abs < 0.01 if val
          else
            result == val
          end

  result = sprintf("%0.1f", result) if result.is_a?(Numeric)

  args = args.map { |n| sprintf("%0.1f", n).ljust(4) }.join(", ")

  table[0, 1] = fun.to_source[6..-3].strip.gsub(/\n/, '')
  table[1, 1] = args
  table[2, 1] = result
  table[3, 1] = truth ? truth.to_s.color(:green) : truth.to_s.color(:red)

  puts table
end

def fun(name, &block)
  self.class.class_eval do
    define_method(name) { |*args| block[*args.map(&:to_f)] }
  end
end

def let(name, &block)
  self.class.class_eval do
    define_method(name, &block)
  end
end
