class puppetrunner {

  case $::kernel {
    'windows': { include puppetrunner::windows }
    default:   { include puppetrunner::nix  }
  }

}
