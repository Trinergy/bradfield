require 'pry'

def get_command
  print "🐚 conch_shell: "

  gets.strip
end


def fork_command(command)
  if command == 'exit'
    puts 'She sells sea shells by the sea shore - goodbye'
    exit
  end

  pid = fork do
    Signal.trap('SIGINT') do
      puts "SIGINT - exiting child for command: #{command}"
      exit
    end
    system(command)
  end

  # pass signal to child
  Signal.trap('SIGINT') do 
    Process.kill 'SIGINT', pid
  end

  Process.wait
  pid
end


loop do
  c = get_command
  fork_command(c)
end