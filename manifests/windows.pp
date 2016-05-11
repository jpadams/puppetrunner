class puppetrunner::windows {

  file { 'C:/ProgramData/PuppetLabs/mcollective/etc/plugins/mcollective/agent/puppetrunner.rb':
    ensure => file,
    source => 'puppet:///modules/puppetrunner/puppetrunner_windows.rb',
    owner  => Administrator,
    group  => Administrators,
    mode   => '0644',
    notify => Service['mcollective']
  }

  file { 'C:/ProgramData/PuppetLabs/mcollective/etc/plugins/mcollective/agent/puppetrunner.ddl':
    ensure => file,
    source => 'puppet:///modules/puppetrunner/puppetrunner.ddl',
    owner  => Administrator,
    group  => Administrators,
    mode   => '0644',
    notify => Service['mcollective']
  }

}
