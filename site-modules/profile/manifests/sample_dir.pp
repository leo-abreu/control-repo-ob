class profile::sample_dir {
  class { 'local_dir':
    dir_name   => 'c:/sample_dir',
    user_name  => 'sample_user',
    group_name => 'sample_group'
  }
}
