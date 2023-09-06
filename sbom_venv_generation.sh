#!/bin/bash -x
# Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.

cd hiq

python -m pip install --upgrade pip
# python -m pip install --upgrade virtualenv

# rm -rf venv
# python -m venv venv
# source venv/bin/activate

pip install setuptools wheel twine
python setup.py sdist bdist_wheel

pip install -r requirements-fastapi.txt
pip install -r requirements-gpu.txt
pip install -r requirements-int.txt
pip install -r requirements-lavis.txt
pip install -r requirements-nodeps.txt
pip install -r requirements-transformers.txt
pip install -r requirements.txt

pip freeze > requirements-frozen.txt

pip install cyclonedx-bom
python -m cyclonedx_py -r -i requirements-frozen.txt -pb --force --format json -o hiq-sbom.cdx.json

# deactivate
