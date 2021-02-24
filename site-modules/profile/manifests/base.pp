class profile::base {

  #the base profile should include component modules that will be on all nodes
  notify { 'Call from profile::base': }
  include profile::base::sevenzip
}
