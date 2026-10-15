EAPI=8

MY_PN="${PN%-bin}"

DESCRIPTION="Environment variable manager for shell (pre-compiled binary)"
HOMEPAGE="https://github.com/${MY_PN}/${MY_PN}"
SRC_URI="https://github.com/${MY_PN}/${MY_PN}/releases/download/v${PV}/${MY_PN}.linux-amd64 -> ${P}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="!app-shells/direnv"

RESTRICT="test strip"

S="${WORKDIR}"

src_unpack() {
	cp "${DISTDIR}/${P}" "${WORKDIR}/${P}" || die "Failed to copy binary to WORKDIR"
}

src_install() {
	newbin "${WORKDIR}/${P}" "${MY_PN}"
}
