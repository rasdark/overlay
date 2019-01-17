# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-plugins/pidgin-sipe/pidgin-sipe-9999.ebuild,v 1.1 2013/04/23 19:54:19 thev00d00 Exp $

EAPI=6

EGIT_BRANCH="fixer"
#EGIT_PROJECT="pidgin-sipe"
EGIT_REPO_URI="https://repo.or.cz/siplcs.git"

inherit autotools eutils git-r3

DESCRIPTION="Pidgin Plug-in SIPE (Sip Exchange Protocol)"
HOMEPAGE="http://sipe.sourceforge.net/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="dbus debug kerberos ocs2005-message-hack openssl telepathy voice"

RDEPEND="
        dev-libs/gmime:2.6
    	dev-libs/libxml2
	    openssl? ( dev-libs/openssl:= )
    	!openssl? ( dev-libs/nss )
	    kerberos? ( virtual/krb5 )
	    voice? (
		    >=dev-libs/glib-2.28.0
    		>=net-libs/libnice-0.1.0
	    	media-libs/gstreamer:1.0
		    net-libs/farstream:0.2
    	)
	    !voice? (
		    >=dev-libs/glib-2.12.0:2
    	)
	    telepathy? (
		    >=sys-apps/dbus-1.1.0
		    >=dev-libs/dbus-glib-0.61
		    >=dev-libs/glib-2.28:2
    		>=net-libs/telepathy-glib-0.18.0
	    )
        net-im/pidgin[dbus?]
"

DEPEND="dev-util/intltool
    	virtual/pkgconfig
	    ${RDEPEND}
"

src_prepare() {
    default
	eautoreconf
}

src_configure() {
	econf \
		--enable-purple \
		--disable-quality-check \
		$(use_enable telepathy) \
		$(use_enable debug) \
		$(use_enable ocs2005-message-hack) \
        $(use_with dbus) \
		$(use_with kerberos krb5) \
		$(use_with voice vv) \
		$(use_enable !openssl nss) \
		$(use_enable openssl)
}

src_install() {
	emake install DESTDIR="${D}"
	dodoc AUTHORS ChangeLog NEWS TODO README
}
