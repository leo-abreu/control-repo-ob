$local_group = 'sample_group'
$local_user  = 'sample_user'
$local_dir   = 'c:/sample_dir/'
user { $local_user:
  ensure => 'absent',
}

group { $local_group:
  ensure => 'absent',
}

file { $local_dir:
  ensure => 'absent',
  force  => true,
}
