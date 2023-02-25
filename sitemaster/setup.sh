#!/usr/bin/bash

readonly CONTENTS_DIR='/var/opt/html'

sudo mkdir -p ${CONTENTS_DIR}
sudo chown admin:admin ${CONTENTS_DIR}
