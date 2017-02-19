# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-cdr/pburn/pburn-3.4.3.ebuild,v 1.3 2013/04/25 14:28:43 ssuominen Exp $

EAPI=4
inherit eutils gnome2-utils

DESCRIPTION="A burning tool with GTK+ frontend"
HOMEPAGE="http://murga-linux.com/puppy/viewtopic.php?t=23881"
SRC_URI="http://www.meownplanet.net/zigbert/${P}.pet
		 http://www.meownplanet.net/zigbert/${PN}_NLS.pet"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
LANGS="de el es fi fr it ja nb pl ru zh_CN"

for LANG in ${LANGS} ; do
	        IUSE+=" linguas_${LANG}"
done

RDEPEND="app-admin/killproc
	app-cdr/cddetect
	app-cdr/dvd+rw-tools
	sys-apps/hotplug2stdout
	virtual/cdrtools
	>=x11-misc/gtkdialog-0.8.0"
DEPEND="app-arch/pet2tgz"

src_unpack() {
	pet2tgz -i "${DISTDIR}"/${P}.pet -o "${WORKDIR}"/${P}.tar.gz
	unpack ./${P}.tar.gz
	pet2tgz -i "${DISTDIR}"/${PN}_NLS.pet -o "${WORKDIR}"/${PN}_NLS.tar.gz
	unpack ./${PN}_NLS.tar.gz
}

src_prepare() {
	epatch "${FILESDIR}/${P}-fix-cat-and-lang.patch"

	cat <<-EOF > "${T}"/${PN}
	#!/bin/bash
	"/usr/share/${PN}/${PN}" "\$@"
	EOF

	sed -i -e 's:usleep:/sbin/&:' usr/local/pburn/box_splash || die
    for lang in ${LANGS};do
        for x in ${lang};do
          if ! use linguas_${x}; then
                rm -r "${WORKDIR}/${PN}_NLS/usr/share/locale/${x}"
          fi
        done
    done

}

src_install() {
	dobin "${T}"/${PN}

	dodir /usr/share
	cp -dpR usr/local/${PN} "${D}"/usr/share || die
	cp -dpR usr/share/applications "${D}"/usr/share/applications || die
	cp -dpR usr/share/icons "${D}"/usr/share/icons || die
    
	# installing locales
	cp -dpR "${WORKDIR}/${PN}_NLS/usr/share/locale" "${D}"/usr/share/locale || die
	
	# installing icons
	tar axf "${FILESDIR}"/hicolor-icons.tar.bz2  -C "${D}"/usr/share || die
	
	dohtml -r usr/share/doc/*.html
}

pkg_preinst() {
        gnome2_icon_savelist
}

pkg_postinst() {
        gnome2_icon_cache_update
}

pkg_postrm() {
        gnome2_icon_cache_update
}

