# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-fps/quake2-data/quake2-data-3.20.ebuild,v 1.28 2014/08/12 11:32:42 vapier Exp $

EAPI=2
inherit unpacker eutils cdrom games

DESCRIPTION="iD Software's Quake 2 ... the data files"
HOMEPAGE="http://www.idsoftware.com/"
SRC_URI="mirror://idsoftware/quake2/q2-${PV}-x86-full-ctf.exe"

LICENSE="Q2EULA"
SLOT="0"
KEYWORDS="~alpha amd64 ~ia64 ppc sparc x86 ~x86-fbsd"
IUSE="videos"

DEPEND="app-arch/unzip"
RDEPEND=""

S=${WORKDIR}

pkg_setup() {
	games_pkg_setup
	if has_version "games-fps/quake2-demodata[symlink]" ; then
		eerror "The symlink for the demo data conflicts with the cdinstall data"
		die "Unmerge games-fps/quake2-demodata to remove the conflict"
	fi
}

src_unpack() {
	export CDROM_NAME_SET=("Existing Install" "Ultimate Quake Edition" "Quake2 CD" "Quake4 Bonus DVD")
	cdrom_get_cds baseq2:Install/patch:Install:Movies
	# The .exe is just a self-extracting .zip
	unpack_zip ${A}
}

src_install() {
	dodoc DOCS/* 3.20_Changes.txt
	newdoc ctf/readme.txt ctf-readme.txt
	dohtml -r "${CDROM_ROOT}"/Install/Data/DOCS/quake2_manual/*

	local baseq2_cdpath
	baseq2_cdpath=${CDROM_ROOT}/Install/Data/baseq2

	dodir "${GAMES_DATADIR}"/quake2/baseq2

	insinto "${GAMES_DATADIR}"/quake2/baseq2/video
	doins "${baseq2_cdpath}"/video/* || die "doins videos"

	insinto "${GAMES_DATADIR}"/quake2/baseq2
	doins "${baseq2_cdpath}"/pak0.pak || die "couldnt grab pak0.pak"
	doins baseq2/*.pak || die "couldnt grab release paks"
	doins baseq2/maps.lst || die "couldnt grab maps.lst"
	dodir "${GAMES_DATADIR}"/quake2/baseq2/players
	cp -R "${baseq2_cdpath}"/players/* baseq2/players/* \
		"${D}/${GAMES_DATADIR}"/quake2/baseq2/players/ || die "couldnt grab player models"

	for mod in ctf rogue xatrix ; do
		if [[ -d ${baseq2_cdpath}/../${mod} ]] ; then
			if use videos && [[ -d ${baseq2_cdpath}/../${mod}/video ]] ; then
				insinto "${GAMES_DATADIR}"/quake2/${mod}/video
				doins "${baseq2_cdpath}"/../${mod}/video/* 2>/dev/null
			fi
			if [[ -n $(ls "${baseq2_cdpath}"/../${mod}/*.pak 2>/dev/null) ]] ; then
				insinto "${GAMES_DATADIR}"/quake2/${mod}
				doins "${baseq2_cdpath}"/../${mod}/*.pak || die "doins ${mod} pak"
			fi
		fi
	done

	insinto "${GAMES_DATADIR}"/quake2/ctf
	doins ctf/*.{cfg,ico,pak} || die "couldnt grab ctf"

	prepgamesdirs
}
