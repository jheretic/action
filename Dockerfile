from archlinux:base-devel

copy pacman.conf /etc/pacman.conf
copy init-image.bash /init-image.bash
run /init-image.bash

add https://github.com/jheretic/pacman-repo-builder/releases/download/test/build-pacman-repo /usr/local/bin/build-pacman-repo
run chmod +x /usr/local/bin/build-pacman-repo

# force makepkg to allow running as root
run build-pacman-repo patch-makepkg --replace

copy run.bash /run.bash

entrypoint ["/run.bash"]
