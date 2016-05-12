module MCollective
  module Agent
    class Puppetrunner<RPC::Agent
      activate_when do
        Facts["kernel"] == "windows"
      end

      action "run" do
        puppet = 'C:\Progra~1\Puppet~1\puppet\bin\puppet.bat'
        command = "cmd /c \"#{puppet} agent -t --detailed-exitcodes\""
        reply[:status] = run(command,:stdout => :out, :stderr => :err, :chomp => true)
      end
    end
  end
end
