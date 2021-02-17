class profile::sample_user {
  class { 'local_user':
    user_name    => 'sample_user',
    local_groups => 'sample_group'
  }
}
