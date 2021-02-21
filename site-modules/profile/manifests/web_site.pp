class profile::web_site{
  $iis_features = ['Web-WebServer','Web-Scripting-Tools']
  $site_path = 'c:\\inetpub\\basic'

  iis_feature { $iis_features:
    ensure => 'present',
  }

  # Delete the default website to prevent a port binding conflict.
  iis_site {'Default Web Site':
    ensure  => absent,
    require => Iis_feature['Web-WebServer'],
  }

  iis_site { 'basic':
    ensure          => 'started',
    physicalpath    => $site_path,
    applicationpool => 'DefaultAppPool',
    require         => [
      File['basic'],
      Iis_site['Default Web Site']
    ],
  }

  file { 'basic':
    ensure => 'directory',
    force  => true,
    path   => $site_path,
  }

  file {"${site_path}\\index.html":
    ensure  => 'file',
    source  => 'puppet:///modules/profile/index.html',
    require => File['basic'],
  }
}
