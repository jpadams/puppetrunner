class puppetrunner::nix {

  file { '/opt/puppetlabs/mcollective/plugins/mcollective/agent/puppetrunner.rb':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/puppetrunner/puppetrunner_nix.rb',
    notify => Service['mcollective']
  }

  file { '/opt/puppetlabs/mcollective/plugins/mcollective/agent/puppetrunner.ddl':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/puppetrunner/puppetrunner.ddl',
    notify => Service['mcollective']
  }

}
