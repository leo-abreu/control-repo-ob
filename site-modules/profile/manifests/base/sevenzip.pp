class profile::base::sevenzip {
  # class { 'archive':
  #   seven_zip_name     => '7-Zip for 64-bit Windows x64',
  #   seven_zip_source   => 'https://www.7-zip.org/a/7z1900-x64.msi',
  #   seven_zip_provider => 'windows',
  # }
  require chocolatey
  notify{ 'inside serverzip class': }
  package {'7zip':
    ensure   => 'installed',
    provider => 'chocolatey',
  }

  # reboot {'after':
  #   subscribe => Package['7zip'],
  # }
}
