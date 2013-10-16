vagrant-big-data
================

To start Hadoop cluster with Sqoop and Pig with Vagrant :
- Clone this repository
- [Install vagrant](http://www.vagrantup.com/) 
- Run the command ```vagrant up``` inside the cloned repository directory
- SSH into the VM by running ```vagrant ssh master```
- Inside the master VM, run the following commands:
    ```sudo ssh 192.168.1.11``` (to 11) and accept authorization
    ```cd /opt/hadoop-1.2.0/bin```
    ```sudo ./hadoop namenode -format```
    ```sudo ./start-all.sh```

This is inspired by [vagrant-hadoop](https://github.com/rkrol/vagrant-hadoop)
