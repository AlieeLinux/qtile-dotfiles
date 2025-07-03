# Maintainer: Ali Ali <ALiseisusarian1111@google.com>
pkgname="linux-hoshino"
pkgver=6.12.33
pkgrel=1
pkgdesc="Linux kernel made with my love for Ai Hoshino"
arch=('x86_64')
url="https://kernel.org/"
license=('GPL-2.0-only')
groups=('base-devel')
depends=('glibc')
replaces=('linux-testing' 'linux-hoshino')
makedepends=('coreutils' "make" "pacman")
optdepends=('coreutils: Like.. really bruh?'
    "ani-cli: Sit back and watch anime."
    "sway: best simple waylander experience"
)
install=linux.install
provides=("pleasure" "AiHoshino" "HoshinoAi" "kernel" "modules" "PeakYuri")

build() {
    cd "$srcdir"
    mkdir -p etc/mkinitcpio.d
    tar -xvf ../*.tar
    rm -rvf boot/System.map*
    rm -rvf boot/vmlinux*
    rm -rvf lib/modules/*/build || return 0
    mv -v boot/config* boot/config-Ai-Hoshino
    mv -v boot/vmlinuz* boot/vmlinuz-Ai-Hoshino
}

package() {
    mkdir -p "$pkgdir/usr/lib" || return 0
    mkdir -p "$pkgdir/etc/mkinitcpio.d/" || return 0
    cp -rvf ../package.preset "$pkgdir/etc/mkinitcpio.d/linux-Ai-Hoshino.preset"
    cp -rvfa -- boot "$pkgdir/" 
    cp -rvfa -- lib/* "$pkgdir/usr/lib" || return 0
}
