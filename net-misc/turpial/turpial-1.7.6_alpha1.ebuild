# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_5,2_6,2_7} )
DISTUTILS_NO_PARALLEL_BUILD=1

inherit distutils-r1

DESCRIPTION="Lightweight and feature full twitter client"
HOMEPAGE="http://turpial.org.ve/"
MY_P=${P/_alpha/-a}
SRC_URI="http://files.turpial.org.ve/sources/development/${MY_P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

REQUIRED_USE="${PYTHON_REQUIRED_USE}"
RDEPEND="${PYTHON_DEPS}"
DEPEND="${PYTHON_DEPS}
	dev-python/Babel[${PYTHON_USEDEP}]
	dev-python/PyQt4[webkit]
	dev-python/libturpial"

S=${WORKDIR}/${MY_P}

PATCHES=( "${FILESDIR}"/${MY_P}-setup.patch )

python_src_compile() {
	${EPYTHON} setup.py build
}
