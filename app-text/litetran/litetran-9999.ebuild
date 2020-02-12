# Copyright 2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI="6"
inherit cmake-utils fdo-mime git-r3

DESCRIPTION="Very simple GUI for text translation (like google translate)."
HOMEPAGE="http://gfarniev.bitbucket.org/litetran/"
EGIT_REPO_URI="https://bitbucket.org/gfarniev/litetran.git"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""
RDEPEND=">=dev-util/cmake-2.8.10
		dev-qt/qtcore:5
		dev-qt/qtgui:5
		dev-qt/qtmultimedia:5
		dev-qt/linguist-tools:5
		dev-qt/qtx11extras:5"
DEPEND="${RDEPEND}"
