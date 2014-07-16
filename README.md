DevOps-Setup-Pyramid-MongoDB-Elastic
====================================

A Sample DevOps Setup for Pyramid Web Server, Mongo DB Database and Elastic Search Server

Prerequistes
------------

* Latest Vagrant
* Latest VirtualBox

Steps
--------

 * $>cd DevOps-Setup-Pyramid-MongoDB-Elastic
 * $>vagrant up

Verify MongoDB Running
------------------------

 * $>vagrant ssh db
 * $>bash
 * $>mongod
 * if Mongo works MongoDB is installed properly

Verify Java Installed
--------------------------
 * $>vagrant ssh db
 * $>bash
 * $> java -version
 * output should be -  java version "1.6.0_31"

Verify Elastic Search Installed
---------------------------------
 * Open http://192.168.33.11:9200 in browser


Verify Easy Install installed
---------------------------------
 * $>vagrant ssh webserver
 * $>bash
 * $> easy_install
 * This should show help
