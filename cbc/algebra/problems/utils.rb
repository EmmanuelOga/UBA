require 'rubygems'
ENC_NONE=nil
require 'sourcify'
require 'matrix'
require 'tablizer'

$header = true
HEADER = ["Function", "Arguments", "Result", "Matches"]

def check(val, *args, &fun)
  if $header
    table, row = Tablizer::Table.new([HEADER], header: true), 1
  else
    table, row = Tablizer::Table.new, 0
  end

  result = fun.call(*args)

  truth = if val.is_a?(Numeric)
            (result - val.to_f).abs < 0.01 if val
          else
            result == val
          end

  result = sprintf("%0.1f", result) if result.is_a?(Numeric)
  result = result.to_s

  args = args.map do |n|
    case n
    when Numeric
      sprintf("%0.1f", n).ljust(4)
    else
      n.to_s
    end
  end.join(", ")

  source = fun.to_source[6..-3].strip.gsub(/\n/, '')

  maxlen = 80
  too_long = source.length + result.length + args.length > maxlen

  table[0, row] = too_long ? source[0..maxlen/3] : source
  table[1, row] = too_long ? "#{args.to_s[0...maxlen/2].color(:blue)} ..." : args
  table[2, row] = too_long ? "#{result.to_s[0...maxlen/2].color(:blue)} ..." : result
  table[3, row] = truth ? truth.to_s.color(:green) : truth.to_s.color(:red)

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

def banner(msg)
  puts "\n#{msg.color(:magenta)}\n\n"
end

class Matrix
  def table
    Tablizer::Table.new(to_a, align: :ansi_rjust).to_s
  end
end
