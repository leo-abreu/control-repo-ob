class profile::sample_acls {
  class { 'local_set_acls':
    dir_name   => 'c:/sample_dir',
    user_name  => 'sample_user',
    group_name => 'sample_group',
  }
}
