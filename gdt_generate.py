# base address
base_addr = "{0:b}".format(int(input("base address (in hex): "), 16))
limit = "{0:b}".format(int(input("limit (size in bytes of segment): ")))
flags = "{0:b}".format(int(input("flags: ")))

privelege = input("privledge (ring levels 0 - 3): ")
type = input("type (1 if code or data, 0 if system): ")
executable = input("executable (1 if code, 0 if data): ")
direction = input("direction (0 if grows up, 1 if grows down): ")
rw = input("read/write (first bit read, second bit write): ")
sz = input("size (0 if 16 bit mode, 1 if 32 bit mode): ")

print(base_addr, limit, flags)
