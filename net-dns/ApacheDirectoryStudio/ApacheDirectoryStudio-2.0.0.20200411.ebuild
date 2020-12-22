# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="6"

inherit eutils versionator

MY_PV=$(replace_version_separator 3 '.v')
MY_PN="${PN}"
MY_PKGM=15


DESCRIPTION="Apache Directory Studio is an universal LDAP directory tool."
SRC_URI="amd64? (
		"http://www.us.apache.org/dist/directory/studio/${MY_PV}-M${MY_PKGM}/${MY_PN}-${MY_PV}-M${MY_PKGM}-linux.gtk.x86_64.tar.gz"
	)"
HOMEPAGE="http://directory.apache.org/studio/"

KEYWORDS="~amd64"
SLOT="2"
LICENSE="Apache-2.0"
IUSE=""

DEPEND="!net-nds/Apache-DS   !net-nds/ApacheDirectoryStudio:0" # obsolete ebuild name
RDEPEND=">=virtual/jre-1.8.0
	x11-libs/gtk+:2"

MY_ARCH="amd64? ( amd64 )"
INSTALL_DIR="/opt"
S="${WORKDIR}/${MY_PN}-linux-${MY_ARCH}-${MY_PV}"

src_install() {

	insinto "${INSTALL_DIR}"

	newicon "${MY_PN}/features/org.apache.directory.studio.schemaeditor.feature_${MY_PV}-M${MY_PKGM}/studio.png" "${MY_PN}.png"
	#newicon "${MY_PN}/icon.xpm" "${MY_PN}.xpm"

	make_desktop_entry "${MY_PN}" "Apache Directory Studio" "${MY_PN}" "System"

	doins -r *

	fperms +x "${INSTALL_DIR}/${MY_PN}/${MY_PN}"

	dosym "${INSTALL_DIR}/${MY_PN}/${MY_PN}" "/usr/bin/${MY_PN}"
}
