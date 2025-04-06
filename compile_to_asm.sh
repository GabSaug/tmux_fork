# $1: name of the c file to compile to assembly
# $2 output path
opt="$(echo $3 | sed -e "s/-O0/$(cat /etc/gcc.opt)/g") -fno-inline -Wno-error -finline-limit=2"
if ! gcc -masm=intel -iquote. -std=gnu99 -O2 -g -Wno-long-long -Wall -W -Wformat=2 -Wmissing-prototypes -Wstrict-prototypes -Wmissing-declarations -Wwrite-strings -Wshadow -Wpointer-arith -Wsign-compare -Wundef -Wbad-function-cast -Winline -Wcast-align -Wdeclaration-after-statement -Wno-pointer-sign -Wno-attributes -Wno-unused-result -Wno-format-y2k $opt -MT server.o -MD -MP -MF $depbase.Tpo -S -o "$2" "$1"; then
	echo "error compile to asm"
	exit 1
fi
