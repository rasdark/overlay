# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

PLOCALES="ru"

inherit cmake-utils l10n qmake-utils git-r3

MY_PN=${PN}-linux
DESCRIPTION="Reliable MTP client with minimalistic UI"
HOMEPAGE="https://whoozle.github.io/android-file-transfer-linux/"

EGIT_BRANCH="master"
EGIT_REPO_URI="https://github.com/whoozle/android-file-transfer-linux.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="fuse debug qt4 qt5 libusb"
REQUIRED_USE="?? ( qt4 qt5 )"

RDEPEND="fuse? ( sys-fs/fuse )
	 qt4?  ( dev-qt/qtgui:4 )
	 qt5?  ( dev-qt/qtwidgets:5 )
	 libusb? ( virtual/libusb:1 )"

DEPEND="${RDEPEND}
	virtual/pkgconfig"

S=${WORKDIR}/${P}

src_configure() {
	local mycmakeargs=(
			-DBUILD_FUSE=$(usex fuse)
			-DUSB_BACKEND_LIBUSB=$(usex libusb)
	)

	CMAKE_BUILD_TYPE="$(usex debug Debug Release)"

	if use qt4 ; then
                mycmakeargs+=( 
			-DBUILD_QT_UI=$(usex qt4)
			-DDESIRED_QT_VERSION=4 )
	elif use qt5 ; then
                mycmakeargs+=( 
			-DBUILD_QT_UI=$(usex qt5)
			-DDESIRED_QT_VERSION=5 )
	else
		mycmakeargs+=(
                       -DBUILD_QT_UI="no" )
        fi


	cmake-utils_src_configure
}


gen_translation() {
        local mydir=""
	if use qt4; then
		mydir="$(qt4_get_bindir)"
	fi

        if use qt5; then
                mydir="$(qt5_get_bindir)"
        fi

        ebegin "Generating $1 translation"
        "${mydir}"/lrelease ${PN}-linux_${1}.ts
        eend $? || die "failed to generate $1 translation"
}

src_compile() {
	if use qt4 || use qt5; then
        	cd qt/translations || die
		rm -f *.qm
        	l10n_for_each_locale_do gen_translation
	fi

	cmake-utils_src_compile
}

src_install() {
	if use qt4; then
		insinto /usr/share/qt4/translations
		doins qt/translations/*.qm
	fi
	if use qt5; then
                insinto /usr/share/qt5/translations
                doins qt/translations/*.qm
        fi


	cmake-utils_src_install
}

pkg_postinst() {
	if use libusb; then
		ewarn "You're using libusb, this is known to be broken -- large memory consumption, violating kernel memory limits and bugs."
		ewarn "Continue at your own  risk!"
	fi
}
