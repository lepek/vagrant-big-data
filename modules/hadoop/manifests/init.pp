class hadoop {
  $hadoop_home = "/opt/hadoop"

  exec { "download_hadoop":
    command => "rm -f /tmp/hadoop.tar.gz && wget -O /tmp/hadoop.tar.gz http://archive.apache.org/dist/hadoop/core/hadoop-1.2.0/hadoop-1.2.0.tar.gz",
    path => $path,
    logoutput => "on_failure",
    timeout => 1800,
    require => Package["openjdk-6-jdk"]
  }

  exec { "unpack_hadoop":
    command => "rm -rf ${hadoop_home}-1.2.0 && tar -zxf /tmp/hadoop.tar.gz -C /opt",
    path => $path,
    logoutput => "on_failure",
    require => Exec["download_hadoop"]
  }

  file { "${hadoop_home}-1.2.0/conf/slaves":
    source => "puppet:///modules/hadoop/slaves",
    mode => 644,
    owner => vagrant,
    group => vagrant,
    require => Exec["unpack_hadoop"]
  }
   
  file { "${hadoop_home}-1.2.0/conf/masters":
    source => "puppet:///modules/hadoop/masters",
    mode => 644,
    owner => vagrant,
    group => vagrant,
    require => Exec["unpack_hadoop"]
  }

  file { "${hadoop_home}-1.2.0/conf/core-site.xml":
    source => "puppet:///modules/hadoop/core-site.xml",
    mode => 644,
    owner => vagrant,
    group => vagrant,
    require => Exec["unpack_hadoop"]
  }
   
  file {
    "${hadoop_home}-1.2.0/conf/mapred-site.xml":
    source => "puppet:///modules/hadoop/mapred-site.xml",
    mode => 644,
    owner => vagrant,
    group => vagrant,
    require => Exec["unpack_hadoop"]
  }
   
  file { "${hadoop_home}-1.2.0/conf/hdfs-site.xml":
    source => "puppet:///modules/hadoop/hdfs-site.xml",
    mode => 644,
    owner => vagrant,
    group => vagrant,
    require => Exec["unpack_hadoop"]
  }
   
  file { "${hadoop_home}-1.2.0/conf/hadoop-env.sh":
    source => "puppet:///modules/hadoop/hadoop-env.sh",
    mode => 644,
    owner => vagrant,
    group => vagrant,
    require => Exec["unpack_hadoop"]
  }

  file { "${hadoop_home}-1.2.0/name":
    ensure => directory,
    mode => 644,
    owner => vagrant,
    group => vagrant,
    require => Exec["unpack_hadoop"]
  }

  file { "${hadoop_home}-1.2.0/data":
    ensure => directory,
    mode => 644,
    owner => vagrant,
    group => vagrant,
    require => Exec["unpack_hadoop"]
  }

  exec { "symlink_hadoop":
    command => "rm -f /usr/lib/hadoop && ln -s ${hadoop_home}-1.2.0 /usr/lib/hadoop",
    path => $path,
    logoutput => "on_failure",
    require => Exec["unpack_hadoop"]
  }

  exec { "set_owner_hadoop":
    command => "chown -R vagrant:vagrant ${hadoop_home}-1.2.0", 
    path => $path,
    logoutput => "on_failure",
    require => Exec["symlink_hadoop"]
  }

  file { "/etc/profile.d/custom_vars.sh":
    source => "puppet:///modules/hadoop/custom_vars.sh",
    mode => 644,
    owner => root,
    group => root
  }
}
