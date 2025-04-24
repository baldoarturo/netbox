#!/bin/bash
sudo apt update 
sudo apt install -y \
python3 python3-pip python3-venv python3-dev \
build-essential libxml2-dev libxslt1-dev libffi-dev libpq-dev libssl-dev zlib1g-dev
sudo apt install -y podman
pip3 install podman-compose
podman-compose -f compose.yml up -d
podman cp netbox-demo-v4.2.sql netbox_postgres_1:/tmp
podman-compose exec postgres sh -c 'cat /tmp/netbox-demo-v4.2.sql | psql -U netbox'
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
cd netbox
./manage.py makemigrations
./manage.py migrate