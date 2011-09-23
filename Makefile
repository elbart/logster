
install:
	/bin/mkdir -p ${DESTDIR}/usr/share/logster
	/bin/mkdir -p ${DESTDIR}/var/log/logster
	/bin/mkdir -p ${DESTDIR}/etc/logster
	/bin/mkdir -p ${DESTDIR}/usr/sbin
	/usr/bin/install -m 0755 -t ${DESTDIR}/usr/sbin logster
	/usr/bin/install -m 0755 -t ${DESTDIR}/etc/logster logster.conf
	#/bin/sed -i 's@%destdir%@${DESTDIR}@g' ${DESTDIR}/etc/logster/logster.conf
	/usr/bin/install -m 0644 -t ${DESTDIR}/usr/share/logster logster_helper.py
	/usr/bin/install -m 0644 -t ${DESTDIR}/usr/share/logster parsers/*

uninstall:
	/bin/rm -f ${DESTDIR}/usr/sbin/logster
	/bin/rm -rf ${DESTDIR}/usr/share/logster
	/bin/rm -rf ${DESTDIR}/var/log/logster

deb:
	debuild -us -uc -i -b

debsrc:
	debuild -us -uc -i -S

debclean:
	debuild clean

clean:
	rm -rf logster.tar.gz
