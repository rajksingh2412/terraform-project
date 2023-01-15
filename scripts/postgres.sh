#!/bin/bash
sudo apt update -y
sudo apt install postgresql postgresql-contrib -y
sudo systemctl start postgresql.service
