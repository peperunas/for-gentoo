# Copyright 2004-2008 Sabayon Linux
# Distributed under the terms of the GNU General Public License v2

inherit eutils versionator

DESCRIPTION="Sabayon Linux Official artwork, can include wallpapers, ksplash, and GTK/QT Themes."
HOMEPAGE="http://www.sabayonlinux.org/"
SRC_URI="http://distfiles.hyperfish.org/x11-themes/${PN}/${P}.tar.lzma"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""
RESTRICT="nomirror"
RDEPEND=""

S="${WORKDIR}/${PN}"

src_install () {
	# Gensplash theme
	cd ${S}/gensplash
	dodir /etc/splash/sabayon
	cp -r ${S}/gensplash/sabayon/* ${D}/etc/splash/sabayon

	# Cursors
	cd ${S}/mouse/entis/cursors/
	dodir /usr/share/cursors/xorg-x11/entis/cursors
	insinto /usr/share/cursors/xorg-x11/entis/cursors/
	doins -r ./

	# Wallpaper
	cd ${S}/background
	insinto /usr/share/backgrounds
	doins *.png
}

pkg_postinst () {
	elog "To update your inframfs use:"
	elog "splash_geninitramfs --verbose --res RESxRES \\"
	elog "--append /boot/initramfs-genkernel-YOURARCH-2.6.xx-sabayon theme"
	elog " "
	elog "To get the GRUB artwork install the latest GRUB"
	elog " "
	ewarn "This is a prelease - ${PV}"
	ewarn "Please report bugs or glitches to"
	ewarn "ian.whyman@sabayonlinux.org or"
	ewarn "Thev00d00 on irc.freenode.net #sabayon"
}
