#============================
#----------------------------
node /^devstack/ {


  exec { "apt-get update":
    command => "/usr/bin/apt-get update && touch /tmp/apt.update",
  }
  
  # class { 'emacs': }    
  class { 'tree':  }



  #=========================
  #-------------------------
  $trema = false


  if $trema {
    $source = "https://github.com/nec-openstack/devstack-quantum-nec-openflow.git"
  }
  else {
    $source = "https://github.com/openstack-dev/devstack.git"
  }


  # Ensure Git is installed
  package { 'git':
    ensure => 'present'
  }


  # Clone the devstack repo
  vcsrepo { "/home/vagrant/work/devstack":
    ensure    => present,
    provider  => git,
    source    => $source,
    user      => 'vagrant',
    require    => Package['git'],
  }
  
  $localrc_cnt = "
ADMIN_PASSWORD=admin
MYSQL_PASSWORD=admin
RABBIT_PASSWORD=admin
SERVICE_PASSWORD=admin
SERVICE_TOKEN=admin
APACHE_USER=vagrant
API_RATE_LIMIT=False
HOST_IP=192.168.5.44
FLOATING_RANGE=192.168.5.224/27
IMAGE_URLS+='http://uec-images.ubuntu.com/precise/current/precise-server-cloudimg-amd64-disk1.img'"

  file { "/home/vagrant/work/devstack/localrc":
    content => "$localrc_cnt",
    require => Vcsrepo["/home/vagrant/work/devstack"],
    group   => "vagrant",
    owner   => "vagrant",
  }
  

}
