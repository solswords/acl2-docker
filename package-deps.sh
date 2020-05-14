#!/bin/bash

# No dependencies yet.  Get dependencies here that we need to appear
# in the final image, not that we just need for building.
apt-get update -y
apt-get install -y libssl-dev gcc perl-modules-5.30 make
rm -rf /build-scripts
