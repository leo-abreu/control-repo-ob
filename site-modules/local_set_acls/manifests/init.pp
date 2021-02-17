class local_set_acls (
  $dir_name = 'c:/puppetdir',
  $user_name = 'puppetuser',
  $group_name = 'puppetgroup'
){
  acl { $dir_name:
    permissions => [
      { identity => $user_name, rights => ['full'] },
      { identity => $group_name, rights => ['read'] }
    ],
  }
}
