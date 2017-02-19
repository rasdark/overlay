# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
DESCRIPTION="Allows to find optimized saving options for popular web formats  for the GIMP"
HOMEPAGE="http://registry.gimp.org/node/33"
SRC_URI="http://registry.gimp.org/files/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="media-gfx/gimp"
DEPEND="${RDEPEND}"

src_install() {
	emake DESTDIR="${D}" install || die

	dodoc AUTHORS BUGS ChangeLog NEWS README TODO || die
}
