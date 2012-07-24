# Distributed under the terms of the GNU General Public License v2

EAPI="2"

inherit rpm

# Revision used by upstream
SRC_REV="3.c2"

MY_P="iscan-plugin-gt-f670-${PV}"

DESCRIPTION="Epson Perfection V200 PHOTO scanner plugin for SANE 'epkowa' backend."
HOMEPAGE="http://www.avasys.jp/english/linux_e/dl_scan.html"
SRC_URI="
	x86? ( http://linux.avasys.jp/drivers/scanner-plugins/GT-F670/${MY_P}-${SRC_REV}.i386.rpm )
	amd64? ( http://linux.avasys.jp/drivers/scanner-plugins/GT-F670/${MY_P}-${SRC_REV}.x86_64.rpm )"

LICENSE="AVASYS"
SLOT="0"
KEYWORDS="amd64 x86"

IUSE=""
IUSE_LINGUAS="ja"

for X in ${IUSE_LINGUAS}; do IUSE="${IUSE} linguas_${X}"; done

DEPEND=">=media-gfx/iscan-2.21.0"
RDEPEND="${DEPEND}"

src_install() {
	local MY_LIB="/usr/$(get_libdir)"

	# install scanner firmware
	insinto /usr/share/iscan
	doins "${WORKDIR}/usr/share/iscan/"*

	# install docs
	if use linguas_ja; then
		dodoc "usr/share/doc/${MY_P}/AVASYSPL.ja.txt"
	 else
		dodoc "usr/share/doc/${MY_P}/AVASYSPL.en.txt"
	fi

	# install scanner plugins
	insinto "${MY_LIB}/iscan"
#	INSOPTIONS="-m0755"
	doins "${WORKDIR}/usr/$(get_libdir)/iscan/"*
}

pkg_postinst() {
	local MY_LIB="/usr/$(get_libdir)"

	# Needed for scaner to work properly.
	iscan-registry --add interpreter usb 0x04b8 0x012e "${MY_LIB}/iscan/libesint7A /usr/share/iscan/esfw7A.bin"
    
	elog
	elog "Firmware file esfw7a.bin for Epson Perfection V200 PHOTO"
	elog "has been installed in /usr/share/iscan and registered for use."
	elog
}

pkg_prerm() {
	local MY_LIB="/usr/$(get_libdir)"

	iscan-registry --remove interpreter usb 0x04b8 0x012e "${MY_LIB}/iscan/libesint7A /usr/share/iscan/esfw7A.bin"
}
