metadata :name        => 'puppetrunner',
         :description => 'Runs puppet agent with detailed exit codes',
         :author      => 'jeremy@puppetlabs.com',
         :license     => 'Apache v2 - No warranty',
         :version     => '1.0',
         :url         => 'http://www.puppet.com',
         :timeout     => 45

action "run", :description => 'Runs puppet agent with detailed exit codes' do
  display :always

  output :status,
         :description => "The exit code of the script",
         :display_as  => "Return Value"

  output :out,
         :description => "The output of the script on stdout",
         :display_as  => "Output Channel"

  output :err,
         :description => "The output of the script on stderr",
         :display_as  => "Error Channel"

end
