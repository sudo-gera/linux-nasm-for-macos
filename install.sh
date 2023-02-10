SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

_addr=$("$SCRIPT_DIR/nasm_get_vm_address.sh")

function installation(){
    mkdir -p ~/.ssh/
    cat "$SCRIPT_DIR/id_rsa_for_nasm.b64" | base64 -d > "$SCRIPT_DIR/id_rsa_for_nasm"
    cp "$SCRIPT_DIR/id_rsa_for_nasm.pub" ~/.ssh/
    cp "$SCRIPT_DIR/id_rsa_for_nasm" ~/.ssh/
    rm "$SCRIPT_DIR/id_rsa_for_nasm"
    cp "$SCRIPT_DIR/nasm.sh" ~/
    cp "$SCRIPT_DIR/nasm_get_vm_address.sh" ~/
    # echo -e "\x1b[95mnote:\x1b[93m if asked override or not, type n and hit <enter>\x1b[0m"
    # echo -e "\x1b[95mnote:\x1b[93m if asked for passphrase, hit <enter> for empty passphrase\x1b[0m"
    # ssh-keygen -qf ~/.ssh/id_rsa_for_nasm
    # echo -e "\x1b[95mnote: in next commands password is password (if asked)\x1b[0m"
    # ssh-copy-id -i ~/.ssh/id_rsa_for_nasm "user@$_addr"
    # ssh-copy-id -i ~/.ssh/id_rsa_for_nasm "exec@$_addr"
    # cp "$SCRIPT_DIR/nasm.sh" ~
    # echo -e "\x1b[92mnice! now you can run \x1b[94m~/nasm.sh\x1b[92m command!\x1b[0m"
}
installation

echo -e "\x1b[92mNice! Now you can use \x1b[94m~/nasm.sh\x1b[92m command! Let's run it now!\x1b[0m"