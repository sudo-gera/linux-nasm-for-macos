# SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
echo "192.168.64.21" > ~/.nasm_vm_address.txt

curl "https://raw.githubusercontent.com/sudo-gera/linux-nasm-for-macos/main/nasm_get_vm_address.sh" > ~/nasm_get_vm_address.sh
chmod 744 ~/nasm_get_vm_address.sh


_addr=$("$SCRIPT_DIR/nasm_get_vm_address.sh")

curl "https://raw.githubusercontent.com/sudo-gera/linux-nasm-for-macos/main/nasm.sh" > ~/nasm.sh
chmod 744 ~/nasm.sh

curl "https://raw.githubusercontent.com/sudo-gera/linux-nasm-for-macos/main/nasm.sh" > ~/nasm.sh
chmod 744 ~/nasm.sh

mkdir -p ~/.ssh/
chmod 700 ~/.ssh

curl "https://raw.githubusercontent.com/sudo-gera/linux-nasm-for-macos/main/id_rsa_for_nasm.b64" | openssl base64 -d > ~/.ssh/id_rsa_for_nasm
chmod 600 ~/.ssh/id_rsa_for_nasm

curl "https://raw.githubusercontent.com/sudo-gera/linux-nasm-for-macos/main/id_rsa_for_nasm.b64" > ~/.ssh/id_rsa_for_nasm.pub
chmod 644 ~/.ssh/id_rsa_for_nasm


echo -e "\x1b[92mNice! Now you can use \x1b[94m~/nasm.sh\x1b[92m command! Let's run it now!\x1b[0m"