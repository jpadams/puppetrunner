module MCollective
  module Agent
    class Stageit<RPC::Agent
      activate_when do
        Facts["kernel"] != "windows"
      end

      action "run" do
        require "tempfile"
        require "base64"

        file = Tempfile.new('puppetrunner')
        path = file.path
        manifest = Base64.decode64(request[:manifest])
        file.write(manifest)
        file.close

        command = "/opt/puppet/bin/puppet apply #{path} --detailed-exitcodes"
        reply[:status] = run(command,:stdout => :out, :stderr => :err, :chomp => true)
        file.unlink
        reply
      end
    end
  end
end
