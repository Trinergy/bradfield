require 'pry'

while true do
  print "🐚 conch_shell: "

  command = gets

  case command
  when nil # Any signal
    puts "\nShe sells sea shells by the sea shore"
    exit
  when 'whoami'
    Process.exec('whoami')
  when 'ls'
    Process.exec('ls')
  when 'pwd'
    Process.exec('pwd')
  else
    puts "🍄 " + command.gsub("\n", '') + ": command not found"
  end
end