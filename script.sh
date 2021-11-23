#!/bin/sh +x
# su - postgres psql -c "create database rms;"
# sudo su postgres -c "psql -U postgres -tc  psql -U postgres -c \"CREATE DATABASE rms\""
sudo su postgres -c "psql -U postgres -c \'CREATE DATABASE rms\'"