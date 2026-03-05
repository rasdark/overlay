# Copyright 2025-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop shell-completion unpacker xdg

MY_PN="${PN/-bin/}"

DESCRIPTION="Windsurf Editor - AI-powered IDE maintaining flow state with instant assistance"
HOMEPAGE="https://windsurf.com/editor"

SRC_URI="https://windsurf-stable.codeiumdata.com/wVxQEIWkwPUEAGf3/apt/pool/main/w/windsurf/Windsurf-linux-x64-${PV}.deb"
S="${WORKDIR}"

LICENSE="Apache-2.0 BSD BSD-1 BSD-2 BSD-4 CC-BY-4.0 ISC LGPL-2.1+ Microsoft-vscode MIT MPL-2.0 openssl PYTHON TextMate-bundle Unlicense UoI-NCSA W3C"
SLOT="0"
KEYWORDS="-* ~amd64"
RESTRICT="mirror strip bindist"

RDEPEND="
	>=app-accessibility/at-spi2-core-2.46.0:2
	app-crypt/libsecret[crypt]
	app-crypt/mit-krb5
	app-misc/ca-certificates
	dev-libs/expat
	dev-libs/glib:2
	dev-libs/nspr
	dev-libs/nss
	media-libs/alsa-lib
	media-libs/libglvnd
	media-libs/mesa
	net-misc/curl
	sys-apps/dbus
	sys-libs/zlib
	sys-process/lsof
	x11-libs/cairo
	x11-libs/gtk+:3
	x11-libs/libdrm
	x11-libs/libX11
	x11-libs/libxcb
	x11-libs/libXcomposite
	x11-libs/libXdamage
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libxkbcommon
	x11-libs/libxkbfile
	x11-libs/libXrandr
	x11-libs/libXScrnSaver
	x11-libs/pango
	x11-misc/xdg-utils
"

QA_PREBUILT="*"

src_install() {
	mkdir -p "${ED}/opt/${MY_PN}" || die
	cp -r "${S}/usr/share/windsurf/"* "${ED}/opt/${MY_PN}" || die

	fperms 4755 /opt/${MY_PN}/chrome-sandbox

	dosym ../../opt/${MY_PN}/${MY_PN} /usr/bin/${MY_PN}

	sed -i \
		-e "s|/usr/share/windsurf/windsurf|/opt/${MY_PN}/${MY_PN}|g" \
		"${S}/usr/share/applications/windsurf.desktop" \
		"${S}/usr/share/applications/windsurf-url-handler.desktop" \
		|| die "sed failed"

	domenu "${S}/usr/share/applications/windsurf.desktop"
	domenu "${S}/usr/share/applications/windsurf-url-handler.desktop"

	doicon "${S}/usr/share/pixmaps/windsurf.png"

	insinto /usr/share/metainfo
	doins "${S}/usr/share/appdata/windsurf.appdata.xml"

	insinto /usr/share/mime/packages
	doins "${S}/usr/share/mime/packages/windsurf-workspace.xml"

	newbashcomp "${S}/usr/share/bash-completion/completions/windsurf" ${MY_PN}
	newzshcomp "${S}/usr/share/zsh/vendor-completions/_windsurf" _${MY_PN}
}

pkg_postinst() {
	xdg_pkg_postinst

	elog "Windsurf Editor has been installed to /opt/windsurf"
	elog ""
	elog "To launch: windsurf"
	elog ""
	elog "Features:"
	elog "  - AI-powered code completion (Cascade)"
	elog "  - Flow state coding assistance"
	elog "  - Built on VS Code foundation"
	elog ""
	elog "Upstream: https://windsurf.com/editor"
}
