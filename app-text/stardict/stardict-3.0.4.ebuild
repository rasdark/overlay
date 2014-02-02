# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-text/stardict/stardict-3.0.3-r2.ebuild,v 1.8 2012/07/29 16:45:05 armin76 Exp $

# NOTE: Even though the *.dict.dz are the same as dictd/freedict's files,
#       their indexes seem to be in a different format. So we'll keep them
#       seperate for now.

EAPI=5

GNOME2_LA_PUNT=yes
GCONF_DEBUG=no

inherit eutils gnome2

DESCRIPTION="A international dictionary supporting fuzzy and glob style matching"
HOMEPAGE="http://code.google.com/p/stardict-3/"
SRC_URI="http://${PN}-3.googlecode.com/files/${P}.tar.bz2
	pronounce? ( http://${PN}-3.googlecode.com/files/WyabdcRealPeopleTTS.tar.bz2 )
	qqwry? ( mirror://gentoo/QQWry.Dat.bz2 )"

LICENSE="CPL-1.0 GPL-3 LGPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+dictdotcn espeak -festival gnome +gucharmap +htmlparse +spell
	-gpe +powerwordparse pronounce qqwry tools +updateinfo +wikiparse
	+wordnet +xdxfparse"

COMMON_DEPEND="dev-libs/glib:2
	dev-libs/libsigc++:2
	sys-libs/zlib
	>=x11-libs/gtk+-2.20:2
	gnome? (
		>=gnome-base/libbonobo-2
		>=gnome-base/libgnome-2
		>=gnome-base/libgnomeui-2
		>=gnome-base/gconf-2
		>=gnome-base/orbit-2
		app-text/scrollkeeper
		app-text/gnome-doc-utils
		)
	gpe? ( gpe-base/libgpewidget )
	gucharmap? ( >=gnome-extra/gucharmap-2.22.1 )
	spell? ( >=app-text/enchant-1.2 )
	tools? (
		dev-libs/libpcre
		dev-libs/libxml2
		virtual/mysql
		)"
RDEPEND="${COMMON_DEPEND}
	espeak? ( >=app-accessibility/espeak-1.29 )
	festival? ( app-accessibility/festival )"
DEPEND="${COMMON_DEPEND}
	app-text/docbook-xml-dtd:4.3
	app-text/gnome-doc-utils
	dev-libs/libxslt
	dev-libs/libsigc++
	dev-util/intltool
	virtual/pkgconfig
	sys-devel/gettext"

RESTRICT="test"
src_prepare(){
	# FIXME: check sigc++
	epatch "${FILESDIR}"/${PN}-3.0.3-zlib-1.2.5.2.patch \
		"${FILESDIR}"/${P}-fix-glib-thread.patch \
		"${FILESDIR}"/${P}-gmodule-underlinking.patch

	epatch_user
	gnome2_src_prepare
}

# FIXME	--disable-schemas-install"
src_configure(){
	G2CONF="
		--enable-dict
		--disable-option-checking
		--disable-esd-support
		--disable-advertisement
		--disable-updateinfo
		--disable-maemo-support
		--disable-darwin-support
		$(use_enable dictdotcn)
		$(use_enable espeak)
		$(use_enable festival)
		$(use_enable gnome gnome-support)
		$(use_enable gpe gpe-support)
		$(use_enable gucharmap)
		$(use_enable htmlparse)
		$(use_enable powerwordparse)
		$(use_enable qqwry)
		$(use_enable spell)
		$(use_enable tools)
		$(use_enable updateinfo)
		$(use_enable wikiparse)
		$(use_enable wordnet)
		$(use_enable xdxfparse)
		"
	if use gnome ; then
		G2CONF+="--enable-scrollkeeper"
	else
		G2CONF+="--disable-scrollkeeper"
	fi
	if use gucharmap ; then
		G2CONF+="--enable-deprecations"
	else
		G2CONF+="--disable-deprecations"
	fi
	gnome2_src_configure
}

src_install() {
	gnome2_src_install

	dodoc dict/doc/{Documentation,FAQ,HACKING,HowToCreateDictionary,Skins,StarDictFileFormat,Translation}

	if use qqwry; then
		insinto /usr/share/stardict/data
		doins ../QQWry.Dat
	fi

	if use pronounce; then
		docinto WyabdcRealPeopleTTS
		dodoc ../WyabdcRealPeopleTTS/{README,readme.txt}
		rm -f ../WyabdcRealPeopleTTS/{README,readme.txt}
		insinto /usr/share
		doins -r ../WyabdcRealPeopleTTS
	fi

	# noinst_PROGRAMS with stardict_ prefix from tools/src/Makefile.am wrt #292773
	if use tools; then
		local app
		local apps="pydict2dic olddic2newdic oxford2dic directory2dic dictd2dic
			wquick2dic ec50 directory2treedic treedict2dir jdictionary mova
			xmlinout soothill kanjidic2 powerword kdic 21tech 21shiji buddhist
			tabfile cedict edict duden stardict-dict-update degb2utf frgb2utf
			jpgb2utf gmx2utf rucn kingsoft wikipedia wikipediaImage babylon
			stardict2txt stardict-verify fest2dict i2e2dict downloadwiki
			ooo2dict myspell2dic exc2i2e dictbuilder tabfile2sql KangXi Unihan
			xiaoxuetang-ja wubi ydp2dict wordnet lingvosound2resdb
			resdatabase2dir dir2resdatabase stardict-index stardict-text2bin
			stardict-bin2text stardict-repair"

		for app in ${apps}; do
			newbin tools/src/${app} ${PN}_${app}
		done
	fi
}

pkg_postinst() {
	elog "Note: festival text to speech (TTS) plugin is not built. To use festival"
	elog 'TTS plugin, please, emerge festival and enable "Use TTS program." at:'
	elog '"Preferences -> Dictionary -> Sound" and fill in "Commandline" with:'
	elog '"echo %s | festival --tts"'
	elog
	elog "You will now need to install stardict dictionary files. If"
	elog "you have not, execute the below to get a list of dictionaries:"
	elog
	elog "  emerge -s stardict-"

	gnome2_pkg_postinst
}
