class profile::webserver{
  windowsfeature { 'Web-WebServer':
    ensure             => present,
    # installsubfeatures => true,
  }
}
