# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit rpm bash-completion-r1

DESCRIPTION="Yandex.Disk official client"
HOMEPAGE="http://disk.yandex.com/"
SRC_URI="
    x86?   ( http://repo.yandex.ru/yandex-disk/rpm/stable/i386/yandex-disk-${PV}-1.fedora.i386.rpm )
    amd64? ( http://repo.yandex.ru/yandex-disk/rpm/stable/x86_64/yandex-disk-${PV}-1.fedora.x86_64.rpm )
    "

DEPEND="sys-libs/zlib"
RDEPEND="${DEPEND}"

SLOT="0"
KEYWORDS="x86 amd64"
IUSE="bash-completion"

LANGS="ru uk tr"
for X in ${LANGS} ; do
        IUSE="${IUSE} linguas_${X}"
done


DEPEND="
    sys-libs/zlib
    "
RDEPEND="${DEPEND}"

RESTRICT="mirror"
QA_PRESTRIPPED="/usr/bin/${PN}"

S=${WORKDIR}

src_unpack() {
    rpm_src_unpack "${A}"
    cd "${S}"
}

locales_install() {
    insinto /usr/share/locale/$@/LC_MESSAGES/
    doins usr/share/locale/$@/LC_MESSAGES/${PN}.mo || die

    insinto /usr/share/man/$@/man1
    doins usr/share/man/$@/man1/${PN}.1.gz || die
}


src_install() {
    exeinto /usr/bin
    doexe usr/bin/${PN} || die

    if use bash-completion; then
      mv etc/bash_completion.d/yandex-disk-completion.bash etc/bash_completion.d/yandex-disk
      dobashcomp etc/bash_completion.d/yandex-disk
    fi


    local l
    for l in ${LANGS}; do
        use linguas_$l && locales_install $l
    done

    insinto /usr/share/man/man1/
    doins usr/share/man/man1/${PN}.1.gz || die
}
