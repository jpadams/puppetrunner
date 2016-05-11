module MCollective
  module Agent
    class Puppetrunner<RPC::Agent
      activate_when do
        Facts["kernel"] != "windows"
      end

      action "run" do
        command = "/opt/puppetlabs/puppet/bin/puppet agent -t --detailed-exitcodes"
        reply[:status] = run(command,:stdout => :out, :stderr => :err, :chomp => true)
      end
    end
  end
end
