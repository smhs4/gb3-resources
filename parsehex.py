hexfile = open("program.hex")

lines = hexfile.readlines()

i=len(lines)-1
while True:
    if not lines[i].startswith("00000000"):
        break
    i = i-1
binfile = open("program.bin",'wb')
for line in lines[:i+1]:
    byte3 = int(line[0:2],16)
    byte2 = int(line[2:4],16)
    byte1 = int(line[4:6],16)
    byte0 = int(line[6:8],16)
    binfile.write(bytes([byte0,byte1,byte2,byte3]))
    # print(byte3)