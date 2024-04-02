# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit autotools cmake xdg-utils

DESCRIPTION="Simple GTK+ v3 OTP client (TOTP and HOTP)"
HOMEPAGE="https://github.com/paolostivanin/OTPClient"
SRC_URI="https://github.com/paolostivanin/OTPClient/archive/v${PV}.zip -> ${P}.zip"
S="${WORKDIR}/OTPClient-${PV}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""
RESTRICT="mirror"

DEPEND="
	>=sys-devel/gcc-6.4.0
    >=dev-util/cmake-3.8.2
	>=dev-libs/libbaseencode-1.0.2
	>=dev-libs/libcotp-1.0.10
	>=dev-libs/protobuf-c-1.3.0
	>=media-gfx/zbar-0.10
"

RDEPEND="
	>=dev-libs/libgcrypt-1.6.0
	>=x11-libs/gtk+-3.22
	>=dev-libs/glib-2.50.0
	>=dev-libs/jansson-2.6.0
	>=dev-libs/libzip-1.0.0
	>=dev-libs/libbaseencode-1.0.9
	>=dev-libs/libcotp-1.2.1
	>=media-gfx/zbar-0.10
	>=media-libs/libpng-1.2.0
"

src_prepare() {
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DCMAKE_INSTALL_PREFIX=/usr ..
    )
    cmake_src_configure
}

pkg_postinst() {
    xdg_desktop_database_update
}

pkg_postrm() {
    xdg_desktop_database_update
}
