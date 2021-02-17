class profile::sample_group {
  class { 'local_group':
    group_name   => 'sample_group',
  }
}
