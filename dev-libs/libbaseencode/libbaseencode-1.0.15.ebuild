# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit cmake

DESCRIPTION="Library written in C for encoding and decoding data using base32 or base64 (RFC-4648)"
HOMEPAGE="https://github.com/paolostivanin/libbaseencode"
SRC_URI="https://github.com/paolostivanin/libbaseencode/archive/v${PV}.zip -> ${P}.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="
	>=sys-devel/gcc-6.4.0
    >=dev-util/cmake-3.8.2
"

src_prepare() {
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DCMAKE_INSTALL_PREFIX:PATH=/usr ../
    )
    cmake_src_configure
}

src_install() {
	cmake_src_install
}
