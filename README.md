vagrant-big-data
========================
Run a mini Hadoop cluster in a single Vagrant VM with Pig and Sqoop, useful for development purposes. 
Installed versions are:
  - Hadoop 1.2
  - Pig 0.11
  - Sqoop 1.4.4


## Instructions

- Clone this repository:
      - ```cd ~/code```
      - ```git clone https://github.com/bbonamin/vagrant-big-data/```
- Download and install [Virtualbox](https://www.virtualbox.org/) and [Vagrant](http://www.vagrantup.com/).
- Register the Vagrant base box (You can find other boxes at http://www.vagrantbox.es/):
      - ```vagrant box add base-hadoop https://dl.dropboxusercontent.com/u/547671/thinkstack-raring64.box```
- Initialize the Vagrant VM and log in via SSH:
      - ```cd vagrant-big-data```
      - ```vagrant up```
      - ```vagrant ssh master```
- Set up and start Hadoop:
      - ```sudo su - root```
      - ```cd /opt/hadoop-1.2.0/bin```
      - ```./hadoop namenode -format```

This is inspired in vagrant-hadoop (https://github.com/rkrol/vagrant-hadoop)
