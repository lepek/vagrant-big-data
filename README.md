vagrant-big-data
========================

To start Hadoop cluster with Sqoop and Pig with Vagrant :
- clone this repository
- [install vagrant](http://www.vagrantup.com/) 
- vagrant box add base-hadoop https://dl.dropboxusercontent.com/u/547671/thinkstack-raring64.box
  (Find other boxes at http://www.vagrantbox.es/)
- vagrant up
- vagrant ssh master
- sudo ssh 192.168.1.11 (to 11) and accept authorization
- cd /opt/hadoop-1.2.0/bin
- sudo ./hadoop namenode -format
- sudo ./start-all.sh

This is inspired in vagrant-hadoop (https://github.com/rkrol/vagrant-hadoop)
