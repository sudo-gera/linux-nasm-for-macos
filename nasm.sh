~/nasm_get_vm_address.sh
_addr="$(cat ~/.nasm_vm_address.txt)"

function usage(){
    echo -e "\x1b[94musage:\x1b[0m"
    echo -e "\x1b[93m  to run 32-bit nasm assembler:\x1b[0m"
    echo -e "\x1b[91m      $0 32 \x1b[95m/path/to/file.asm\x1b[0m"
    echo -e "\x1b[91m\x1b[0m"
    echo -e "\x1b[93m  to run 64-bit nasm assembler:\x1b[0m"
    echo -e "\x1b[91m      $0 64 \x1b[95m/path/to/file.asm\x1b[0m"
    echo -e "\x1b[91m\x1b[0m"
    echo -e "\x1b[93m  to run 64-bit nasm assembler with gcc (printf,scanf):\x1b[0m"
    echo -e "\x1b[91m      $0 64g \x1b[95m/path/to/file.asm\x1b[0m"
    echo -e ""
    echo -e "\x1b[94msome useful commands:\x1b[0m"
    echo -e "\x1b[93m  to connect to virtual machine:\x1b[0m"
    echo -e "\x1b[91m      ssh user@$_addr\x1b[0m"
    echo -e "\x1b[93m  to copy file to virtual machine:\x1b[0m"
    echo -e "\x1b[91m      scp \x1b[95m/path/in/mac/to/file\x1b[91m user@$_addr:\x1b[95m./path/in/vm/to/save/file/from/home/directory\x1b[0m"
    echo -e "\x1b[93m  or\x1b[0m"
    echo -e "\x1b[91m      scp \x1b[95m/path/in/mac/to/file\x1b[91m user@$_addr:\x1b[95m/absolute/path/in/vm/to/save/file\x1b[0m"
    echo -e "\x1b[93m  to copy file from virtual machine:\x1b[0m"
    echo -e "\x1b[91m      scp user@$_addr:\x1b[95m/absolute/path/in/vm/to/file\x1b[0m \x1b[95m/path/in/mac/to/save/file\x1b[0m"
    echo -e "\x1b[93m  or\x1b[0m"
    echo -e "\x1b[91m      scp user@$_addr:.\x1b[95m/path/in/vm/to/file/from/home/directory\x1b[0m \x1b[95m/path/in/mac/to/save/file\x1b[0m"
    exit 1
}

if (( $# < 1 ))
then
    usage
fi

_arch="32"
_file=""

if (( $# < 2 ))
then
    _file="$1"
elif [ "$1" == "32" ]
then
    _arch="$1"
    _file="$2"
elif [ "$1" == "64" ]
then
    _arch="$1"
    _file="$2"
elif [ "$1" == "64g" ]
then
    _arch="$1"
    _file="$2"
else
    usage
fi

if [ "$_file" == "" ]
then
    usage
fi



if [ "$_arch" == "32" ]
then
    _comm=$(cat "$_file" | base64)
    _comm="echo "$_comm" | base64 -d > ./awesome_file.asm && nasm -felf32 awesome_file.asm -o a.o && ld -m elf_i386 a.o"
    ssh "user@$_addr" "$_comm"
    ssh exec@$_addr
elif [ "$_arch" == "64" ]
then
    _comm=$(cat "$_file" | base64)
    _comm="echo "$_comm" | base64 -d > ./awesome_file.asm && nasm -felf64 awesome_file.asm -o a.o && ld -m elf_x86_64 a.o"
    ssh "user@$_addr" "$_comm"
    ssh exec@$_addr
elif [ "$_arch" == "64g" ]
then
    _comm=$(cat "$_file" | base64)
    _comm="echo "$_comm" | base64 -d > ./awesome_file.asm && nasm -felf64 awesome_file.asm -o a.o && gcc -no-pie a.o"
    ssh "user@$_addr" "$_comm"
    ssh exec@$_addr
fi



