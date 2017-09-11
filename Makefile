NAME=bclskel
VERSION=6.0.0

DESTDIR=
FILES=.Xresources .bash_logout .bash_profile .bashrc \
	.cshrc .emacs .emacs.el .gitconfig .rpmmacros .screenrc
XINITFILE=install-proxy-private.sh

install: mkrpmdir
	install -d ${DESTDIR}/etc/skel
	install -d ${DESTDIR}/etc/X11/xinit/xinitrc.d/
	cp -r rpm ${DESTDIR}/etc/skel
	cp -r lib ${DESTDIR}/etc/skel
	cp -r public_html ${DESTDIR}/etc/skel
	cp ${XINITFILE} ${DESTDIR}/etc/X11/xinit/xinitrc.d/

mkrpmdir:
	mkdir -p ${DESTDIR}/etc/skel/rpm/{BUILD,RPMS,SOURCES,SPECS,SRPMS}
	mkdir -p ${DESTDIR}/etc/skel/rpm/RPMS/{i386,noarch,ppc}

version:
#        perl -p -i -e "s/^Version.*/Version: $(VERSION)/" ${NAME}.spec

targz: clean version
	cd .. && rm -rf ${NAME}-${VERSION}
	cd .. && cp -arf ${NAME} ${NAME}-${VERSION}
	cd .. && tar cf - ${NAME}-${VERSION} --exclude CVS | gzip -9 > ${NAME}-${VERSION}.tar.gz
	rm -rf ${NAME}-${VERSION}

rpm: targz
	rpm -ba etcskel.spec

clean:
	rm -fr *~ .*???~
