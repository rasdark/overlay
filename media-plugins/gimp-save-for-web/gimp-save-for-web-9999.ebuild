# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: media-plugins/gimp-save-for-web-9999 $

EAPI="4"

EGIT_BRANCH="master"
EGIT_PROJECT="gimp-save-for-web"
EGIT_REPO_URI="git://github.com/auris/gimp-save-for-web.git"

inherit git-2 autotools

DESCRIPTION="Allows to find optimized saving options for popular web formats  for the GIMP"
HOMEPAGE="http://registry.gimp.org/node/33"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

RDEPEND="media-gfx/gimp"
DEPEND="${RDEPEND}"

src_prepare() {
    eautoreconf || die "eautoreconf failed"
}

src_configure() {
        econf || die "econf failed"
}
    
src_compile() {
    emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc AUTHORS BUGS ChangeLog NEWS README TODO || die
}
