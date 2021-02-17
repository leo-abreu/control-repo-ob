class local_dir (
  $dir_name = 'c:/puppetdir',
  $user_name = 'puppetuser',
  $group_name = 'puppetgroup'
){
  file { $dir_name:
    ensure => 'directory',
    owner  => $user_name,
    group  => $group_name,
  }
}
