#!/usr/bin/ruby
max_time = 2100 # 2100 seconds is 35 minutes, alternately, one can use 300 seconds ( 5 minutes )
ps_list = `ps h -eo cputime,pcpu,pid,user,cmd` 
# The ps command is executed with several arguments that will enable the script to target abusive processes.  
# The 'h' flag removes the header from the 'ps' output.  
# Since we are dictating the fields used, we don't need to label the fields. 
# Next, -e is used to show all processes on the system; -A could have also been used instead of -e.  The second part of the flag is o, and that flag allows us to specify the output.  
# The rest of the command shows which fields we are interested in retrieving: cputime, pcpu, pid, user, and command.

list = ps_list.split (/\n/) # cool- if we deploy the command 'ps', we will get each process on a new line.  hence, we pass the 'split' (splits up a string) method with the parameter of line breaks!
# furthermore, this variable 'list' we created now contains an array of each process and its details. 


list.each.do |woohoo|
  process = woohoo.split
  process[0] =~ /(\d+):(\d+):(\d+)/
  cpu_time = $1 * 3600 + $2 * 60 + $3
  next if cpu_time < $max_time  
  next if process[3] == "root" or process[3] == "postfix"
  next if process[4] == "kdeinit"

    begin
     print "So, would you like to murder: #{process[4]} (y/n)? " 
     if gets.downcase == "y"
       Process.kill :TERM,process[2]
     end
    rescue 
      puts "Hm, I couldn't murder your process... check permission, maybe."
      retry
    end
end

