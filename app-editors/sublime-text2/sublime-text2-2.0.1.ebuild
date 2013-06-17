# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit eutils

DESCRIPTION="Sublime Text is a sophisticated text editor for code, html and prose"
HOMEPAGE="http://www.sublimetext.com"

SRC_URI="amd64? ( http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%20${PV}%20x64.tar.bz2 )
	x86?  ( http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%20${PV}.tar.bz2 )"
LICENSE="Unlicense"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="x11-libs/gtk+:2"

S=${WORKDIR}/"Sublime Text 2"

src_install() {
	insinto /opt/${PN}
	into /opt/${PN}
	exeinto /opt/${PN}
	doins -r "lib"
	doins -r "Pristine Packages"
	doins "sublime_plugin.py"
	doins "PackageSetup.py"
	doexe "sublime_text"
	local env_file=07${PN}
	echo "PATH=/opt/${PN}" > ${env_file}
	echo "ROOTPATH=/opt/${PN}" >> ${env_file}
	doenvd ${env_file}
	make_desktop_entry "sublime_text" "Sublime Text Editor"	"accessories-text-editor" "Office;TextEditor"
}
