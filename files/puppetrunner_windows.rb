module MCollective
  module Agent
    class Puppetrunner<RPC::Agent
      activate_when do
        Facts["kernel"] == "windows"
      end

      action "run" do
        case Facts["hardwaremodel"]
        when "x64"
          puppet = 'C:/Progra~2/Puppet~1/Puppet~1/bin/puppet.bat'
        else # 32bit
          puppet = 'C:/Progra~1/Puppet~1/Puppet~1/bin/puppet.bat'
        end
        command = "cmd /c \"#{puppet} agent -t --detailed-exitcodes\""
        reply[:status] = run(command,:stdout => :out, :stderr => :err, :chomp => true)
      end
    end
  end
end
