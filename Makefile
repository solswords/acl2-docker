
acl2-docker-image-updated : Dockerfile build-scripts.tar.gz package-deps.sh
	docker build . --tag acl2
	touch acl2-docker-image-updated

BUILDSCRIPTS := glucose-build.sh \
                acl2-build.sh \
                ccl.sh \
                ccl-build.sh \
                cleanup.sh \
                glucose-ipasir-build.sh \
                glucose-ipasir-patch \
                ubuntu-build-pkgs.sh

build-scripts.tar.gz : $(BUILDSCRIPTS)
	tar czf build-scripts.tar.gz $(BUILDSCRIPTS)

