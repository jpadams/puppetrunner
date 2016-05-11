class puppetrunner::nix {

  file { '/opt/puppet/libexec/mcollective/mcollective/agent/puppetrunner.rb':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/puppetrunner/puppetrunner_nix.rb',
    notify => Service['mcollective']
  }

  file { '/opt/puppet/libexec/mcollective/mcollective/agent/puppetrunner.ddl':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/puppetrunner/puppetrunner.ddl',
    notify => Service['mcollective']
  }

}
