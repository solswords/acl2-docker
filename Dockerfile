# Docker build for ACL2 running on CCL with glucose, libipasirglucose, and abc


FROM ubuntu:20.04 AS acl2_build_base
COPY package-deps.sh /build-scripts/package-deps.sh
RUN /build-scripts/package-deps.sh

FROM acl2_build_base AS acl2_build_deps
ADD build-scripts.tar.gz /build-scripts
RUN /build-scripts/ubuntu-build-pkgs.sh

FROM acl2_build_deps AS acl2_build
RUN /build-scripts/ccl-build.sh /usr/local/src /usr/local/bin /build-scripts
RUN /build-scripts/acl2-build.sh /usr/local/src /usr/local/bin
RUN /build-scripts/glucose-ipasir-build.sh /usr/local/src /usr/local/lib /build-scripts
RUN /build-scripts/glucose-build.sh /usr/local/src /usr/local/bin
RUN /build-scripts/cleanup.sh /usr/local/src

FROM acl2_build_base AS acl2
COPY --from=acl2_build /usr/local/ /usr/local/

FROM scratch
COPY --from=acl2 / /

