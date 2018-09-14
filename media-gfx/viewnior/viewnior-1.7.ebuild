# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
inherit gnome2-utils autotools meson xdg-utils

MY_PN="Viewnior"

DESCRIPTION="Fast and simple image viewer"
HOMEPAGE="http://siyanpanayotov.com/project/viewnior"

SRC_URI="https://github.com/hellosiyan/${MY_PN}/archive/${P}.zip"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-libs/glib-2.32:2
    dev-util/desktop-file-utils
    >=media-gfx/exiv2-0.21:=
    >=x11-libs/gdk-pixbuf-0.21:2
    >=x11-libs/gtk+-2.20:2
    >=x11-misc/shared-mime-info-0.20"

RDEPEND="${DEPEND}"

DOCS="AUTHORS NEWS README.md TODO"

S=${WORKDIR}/${MY_PN}-${P}

pkg_postinst() {
    xdg_desktop_database_update
    gnome2_icon_cache_update
}

pkg_postrm() {
    xdg_desktop_database_update
    gnome2_icon_cache_update
}
