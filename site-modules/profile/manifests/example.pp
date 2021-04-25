class profile::example (
  $user_pw = undef,
  $testvar = undef,
  $message = undef,
){
  $dir_name = 'c:/exampledir'
  $user_name = 'exampleuser'
  $group_name = 'examplegroup'

  group { $group_name:
    ensure   => 'present',
  }
  notify{"Business unit: ${facts['bu']}":}
  notify{"host value = ${facts['host']}":}
  # if $facts['host'] =~ /^b/ {
  #   notify {'Server is a member of the \'Banking\' Business Unit':}
  # }
  # if $facts['host'] =~ /^r/ {
  #   notify {'Server is a member of the \'Retail\' Business Unit':}
  # }
  notify{"message: ${message}":}
  notify{"profile::example::user_pw: ${user_pw}":}
  notify{"profile::example::testvar: ${testvar}":}

  user { $user_name:
    ensure => 'present',
    roles  => 'SeServiceLogonRight',
    groups => $group_name,
  }

  file { $dir_name:
    ensure => 'directory',
    owner  => $user_name,
    group  => $group_name,
  }

  acl { $dir_name:
    permissions => [
      { identity => $user_name, rights => ['full'] },
      { identity => $group_name, rights => ['read'] }
    ],
  }

  # Enable IE Enhanced Security Configuration
  # Reference: https://docs.microsoft.com/en-us/troubleshoot/browsers/enhanced-security-configuration-faq
  # HKEY_CURRENT_USER reg tree settings not supported by puppetlabs-registry module
  registry_value {'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap':
    ensure => present,
    type   => dword,
    data   => 1,
  }

  # Enable the Windows Shutdown Event Tracker
  # Reference: https://www.itprotoday.com/cloud-computing/how-do-i-enabledisable-shutdown-event-tracker
  registry_value {'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Reliability\ShutdownReasonUI':
    ensure => present,
    type   => dword,
    data   => 1,
  }

}
