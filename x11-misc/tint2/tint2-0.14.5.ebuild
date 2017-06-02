# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-misc/tint2/tint2-0.11-r1.ebuild,v 1.3 2011/04/25 13:52:51 tomka Exp $

EAPI="6"

inherit cmake-utils gnome2-utils

DESCRIPTION="A lightweight panel/taskbar"
HOMEPAGE="https://gitlab.com/o9000/tint2.git"
SRC_URI="https://gitlab.com/o9000/${PN}/repository/archive.tar.gz?ref=v${PV} -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="battery debug examples tint2conf startup-notification svg themes udev"

RDEPEND="startup-notification? ( x11-libs/startup-notification )
        tint2conf? ( x11-libs/gtk+:2 )
        dev-libs/glib:2
        svg? ( gnome-base/librsvg:2 )
        media-libs/imlib2[X,png]
        x11-libs/cairo
        x11-libs/libX11
        x11-libs/libXinerama
        x11-libs/libXdamage
        x11-libs/libXcomposite
        x11-libs/libXrender
        x11-libs/libXrandr
        x11-libs/pango[X]"

DEPEND="${RDEPEND}
        virtual/pkgconfig
        x11-proto/xineramaproto"

S="${WORKDIR}/${PN}-v${PV}"

src_unpack() {
        default
        mv "${PN}-v${PV}-"* "${PN}-v${PV}"
}

src_configure() {
        local mycmakeargs=(
                -DENABLE_BATTERY="$(usex battery)"
                -DENABLE_BACKTRACE="$(usex debug)"
                -DENABLE_BACKTRACE_ON_SIGNAL="$(usex debug)"
                -DENABLE_EXTRA_THEMES="$(usex themes)"
                -DENABLE_EXAMPLES="$(usex examples)"
                -DENABLE_SN="$(usex startup-notification)"
                -DENABLE_RSVG="$(usex svg)"
                -DENABLE_TINT2CONF="$(usex tint2conf)"
                -DENABLE_UEVENT="$(usex udev)"
        )
        cmake-utils_src_configure
}

src_install() {
        cmake-utils_src_install
}

pkg_preinst() { gnome2_icon_savelist; }
pkg_postinst() { gnome2_icon_cache_update; }
pkg_postrm() { gnome2_icon_cache_update; }
