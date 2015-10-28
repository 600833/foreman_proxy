#!/bin/ruby
s0=ARGV[0]
s=ARGV[1]
cmd_log='/var/log/foreman-proxy/puppetrun_cmd.txt'
exclude_list=['ivq-ms-srv-frm.ivq.tcs','ivq-ms-srv-rpo.ivq.tcs','ivq-ms-srv-adm.ivq.tcs']
unless exclude_list.include? s then
 s1=s.sub(/(?<v1>[^\.]+)/,'\k<v1>.adm')
else
 s1=s
end
s3="#{s0} #{s1}"
puts s3
File.open(cmd_log, 'a+') { |file| file.write(Time.now.to_s + ' : ' + s3 + "\n") }
x=system("sudo "+s3)
exit 0 if x
exit -1
