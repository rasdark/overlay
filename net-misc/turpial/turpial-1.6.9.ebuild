# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

PYTHON_DEPEND="2:2.6:2.7"

SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="Lightweight and feature full microblogging client"
HOMEPAGE="http://turpial.org.ve/"
SRC_URI="http://files.turpial.org.ve/sources/stable/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=">=dev-python/Babel-0.9.5
	>=dev-python/setuptools-0.6.14"

RDEPEND="${DEPEND}
	dev-python/gtkspell-python
	dev-python/notify-python
	dev-python/pygtk
	dev-python/gst-python
	dev-python/pywebkitgtk
	media-libs/gst-plugins-base"

RESTRICT_PYTHON_ABIS="2.5 3.*"
