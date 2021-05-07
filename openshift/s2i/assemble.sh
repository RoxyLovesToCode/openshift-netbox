#!/bin/bash

set -e

shopt -s dotglob
echo "---> Installing application source ..."
mv /tmp/src/* "$HOME"

echo "---> Installing actual setuptools ..."
pip install --upgrade pip==20.1
pip install --upgrade setuptools==46.2.0

echo "---> Installing dependencies ..."
pip install -r requirements.txt

echo "---> Installing extra dependencies ..."
pip3 install \
    whitenoise==5.0.1 \
    social-auth-core==3.1.0 \
    social-auth-app-django==3.1.0

# Custom settings.py
# mv netbox/netbox/settings.py netbox/netbox/upstream_settings.py
# cp /opt/app-root/etc/settings.py netbox/netbox/settings.py
# cp /opt/app-root/etc/openshift_urls.py netbox/netbox/openshift_urls.py
# cp /opt/app-root/etc/openshift_middleware.py netbox/netbox/openshift_middleware.py
# cp /opt/app-root/etc/openshift_auth.py netbox/netbox/openshift_auth.py

fix-permissions /opt/app-root
