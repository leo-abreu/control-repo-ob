class local_group (
  $group_name = 'puppetgroup',
){
  group { $group_name:
    ensure   => 'present',
  }
}
