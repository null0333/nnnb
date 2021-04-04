# nnnb
### nulls no nonsense bootloader

Eventually going to be a single sector, real mode linux bootloader.
Currently working on figuring out addressing in unreal mode.

To run:
```nasm -f bin nnnb_3.asm -o nnnb.bin && qemu-system-x86_64 -fda nnnb.bin```
