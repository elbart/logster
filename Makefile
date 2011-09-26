
install:
	/usr/bin/install -d ${DESTDIR}/usr/share/logster
	/usr/bin/install -d ${DESTDIR}/etc/logster
	/usr/bin/install -d ${DESTDIR}/var/log/logster
	/usr/bin/install -d ${DESTDIR}/usr/sbin
	/usr/bin/install -d ${DESTDIR}/usr/local/var/run/logster

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
