SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

mkdir -p ~/.ssh/
chmod 700 ~/.ssh
cat "$SCRIPT_DIR/id_rsa_for_nasm.b64" | base64 -d > "$SCRIPT_DIR/id_rsa_for_nasm"
cp "$SCRIPT_DIR/id_rsa_for_nasm.pub" ~/.ssh/
chmod 644 ~/.ssh/id_rsa_for_nasm.pub
cp "$SCRIPT_DIR/id_rsa_for_nasm" ~/.ssh/
chmod 600 ~/.ssh/id_rsa_for_nasm
rm "$SCRIPT_DIR/id_rsa_for_nasm"
cp "$SCRIPT_DIR/nasm.sh" ~/
chmod 744 ~/nasm.sh
cp "$SCRIPT_DIR/nasm_get_vm_address.sh" ~/
chmod 744 ~/nasm_get_vm_address.sh

echo "192.168.64.21" > ~/.nasm_vm_address.txt
~/nasm_get_vm_address.sh

echo -e "\x1b[92mNice! Now you can use \x1b[94m~/nasm.sh\x1b[92m command! Let's run it now!\x1b[0m"