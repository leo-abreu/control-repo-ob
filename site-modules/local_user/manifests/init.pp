class local_user (
  $user_name = 'puppetuser',
  $local_groups = undef
){
  user { $user_name:
    ensure => 'present',
    roles  => 'SeServiceLogonRight',
    groups => "${local_groups}"
  }
}
