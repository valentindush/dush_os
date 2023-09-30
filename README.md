# DUSH OS
Learning how to make an operating system

## Requirements
- [QEMU](https://www.qemu.org/)
- [NASM](https://www.nasm.us/)
- [GCC](https://gcc.gnu.org/)
- [GNU Make](https://www.gnu.org/software/make/)
- [GRUB](https://www.gnu.org/software/grub/)
- [GNU Binutils](https://www.gnu.org/software/binutils/)
- [GNU Coreutils](https://www.gnu.org/software/coreutils/)
- [GNU Bash](https://www.gnu.org/software/bash/)
- [GNU Sed](https://www.gnu.org/software/sed/)
- [GNU Awk](https://www.gnu.org/software/gawk/)
- [GNU Grep](https://www.gnu.org/software/grep/)
- [GNU Findutils](https://www.gnu.org/software/findutils/)
- [GNU Tar](https://www.gnu.org/software/tar/)
- [GNU Gzip](https://www.gnu.org/software/gzip/)
- [GNU Wget](https://www.gnu.org/software/wget/)

and the list goes on :lol

## HOW TO??
### Bootloader
The first thing while making an OS kernel is a bootloader

`bootloader/bootloader.asm`

1. Compiling the boatloader into **Machine Code**:
" ``nasm -f bin booatloader.asm -o bootloader``"

2. Creating a floppy disk image:
 "``dd if=/dev/zero of=bootloader.img bs=512 count=2880``
"
3. Write the bootloader to the first sector
" ``dd if=bootloader of=bootloader.img conv=notrunc``"
4. Run the bootloader using QUMU
"``qemu-system-i386-machine q35-fda disk.img-gdb
 tcp::26000-S``"
