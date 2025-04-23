#!/bin/bash
sudo apt update 
sudo apt install -y \
python3 python3-pip python3-venv python3-dev \
build-essential libxml2-dev libxslt1-dev libffi-dev libpq-dev libssl-dev zlib1g-dev
sudo apt install -y podman
pip3 install podman-compose
python3 -m venv venv
source venv/bin/activate
pip install -r requeriments.txt
