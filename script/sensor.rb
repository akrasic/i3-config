#!/usr/bin/env ruby

def get_temp(t)
  t.split("\s")[1][/([0-9]*)\.[0-9]/]
end

temp = []

`sensors`.split("\n").each do |s|
  case s
  when /CPUTIN/
    temp << "CPU: #{get_temp(s)}"
  when /SYSTIN/
    temp << "SYS: #{get_temp(s)}"
  end
end

puts temp.join('|')
