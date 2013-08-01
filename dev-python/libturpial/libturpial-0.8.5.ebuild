# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_5,2_6,2_7} )
DISTUTILS_NO_PARALLEL_BUILD=1

inherit distutils-r1

DESCRIPTION="handles multiple microblogging protocols"
HOMEPAGE="http://turpial.org.ve/"
SRC_URI="http://files.turpial.org.ve/sources/stable/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}"/${P}-setup.patch )
