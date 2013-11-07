class sqoop {

  $sqoop = "sqoop-1.4.4.bin__hadoop-1.0.0"

  exec { "remove_old_temp_sqoop":
    command =>  "rm -f /tmp/${sqoop}.tar.gz",
    path => $path
  }

  exec { "remove_installed_sqoop":
    command => "rm -rf /opt/${sqoop}",
    path => $path
  }

  exec { "download_sqoop":
    command => "wget -O /tmp/${sqoop}.tar.gz http://www.trieuvan.com/apache/sqoop/1.4.4/${sqoop}.tar.gz",
    path => $path,
    timeout => 1800,
    logoutput => "on_failure",
    require => [Package["openjdk-6-jdk"], Exec["remove_old_temp_sqoop"], Exec["remove_installed_sqoop"]],
    creates => "/tmp/${sqoop}.tar.gz"
  }

  exec { "unpack_sqoop":
    command => "tar -zxf /tmp/${sqoop}.tar.gz -C /opt",
    path => $path,
    logoutput => "on_failure",
    require => Exec["download_sqoop"]
  }

  exec { "install_mysql_connector":
    command => "wget -O /opt/${sqoop}/lib/mysql-connector-java-5.0.5.jar http://repo1.maven.org/maven2/mysql/mysql-connector-java/5.0.5/mysql-connector-java-5.0.5.jar",
    path => $path,
    timeout => 1800,
    logoutput => "on_failure",
    require => Exec["unpack_sqoop"]
  }

  exec { "install_postgre_connector":
    command => "wget -O /opt/${sqoop}/lib/postgresql-9.1-901.jdbc4.jar http://repo1.maven.org/maven2/postgresql/postgresql/9.1-901.jdbc4/postgresql-9.1-901.jdbc4.jar",
    path => $path,
    timeout => 1800,
    logoutput => "on_failure",
    require => Exec["unpack_sqoop"]
  }

  exec { "symlink_sqoop":
    command => "rm -f /usr/lib/sqoop && ln -s /opt/${sqoop} /usr/lib/sqoop",
    path => $path,
    logoutput => "on_failure",
    require => Exec["unpack_sqoop"]
  }

  exec { "set_owner_sqoop":
    command => "chown -R vagrant:vagrant /opt/${sqoop}", 
    path => $path,
    logoutput => "on_failure",
    require => Exec["symlink_sqoop"]
  }

}