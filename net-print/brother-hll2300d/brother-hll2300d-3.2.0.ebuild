# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8
inherit unpacker

DESCRIPTION="Cups ppd and filters for Brother HL-L2300D"
HOMEPAGE="http://www.brother.ru/printers/laser/hl-l2300dr#downloads"
SRC_URI="http://download.brother.com/welcome/dlf101900/hll2300dlpr-3.2.0-1.i386.deb
         http://download.brother.com/welcome/dlf101901/hll2300dcupswrapper-3.2.0-1.i386.deb"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="net-print/cups"
RDEPEND="${DEPEND}"

QA_PREBUILT="*"
S=${WORKDIR}

src_install() {
        FILTER="/usr/libexec/cups/filter"
        exeinto ${FILTER}
        doexe "opt/brother/Printers/HLL2300D/cupswrapper/brother_lpdwrapper_HLL2300D"
        doexe "opt/brother/Printers/HLL2300D/cupswrapper/paperconfigml1"
        insinto ${FILTER}
        doins -r "opt/brother/Printers/HLL2300D/inf"
        fperms 755 ${FILTER}/inf/braddprinter ${FILTER}/inf/setupPrintcap

        insinto /usr/share/cups/model
        doins "opt/brother/Printers/HLL2300D/cupswrapper/brother-HLL2300D-cups-en.ppd"
}
