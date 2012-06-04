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

class TrueClass
  def to_s
    "true".color(:green)
  end
end

class FalseClass
  def to_s
    "false".color(:red)
  end
end

require 'rational'

def r(n, d = 1)
  Rational n, d
end

class Matrix
  def self.from_column_vectors(cvs)
    number_of_rows = cvs.first.row_size
    rows = (0...number_of_rows).map { |n| cvs.map { |c| c[n, 0] } }
    Matrix[*rows]
  end

  ZERO_F = 0.1*(10**-10)

  def zero?
    all? { |n| (n.to_f).abs < ZERO_F }
  end
end

class Rational
  def to_s
    self == 0 ? "0" : to_f.to_s
  end
end
