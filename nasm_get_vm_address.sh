function bad_addr(){
    echo -e "\x1b[91mcannot connect to $(cat ~/.nasm_vm_address.txt)\x1b[0m"
    echo -e "\x1b[95mgive me vm address (you can see it inside virtual machine)\x1b[0m"
    echo -e "\x1b[94mleave empty to try again with $(cat ~/.nasm_vm_address.txt)\x1b[0m"
    echo -e "\x1b[93mhit ctrl+C to cancel\x1b[0m"
    read _addr
    if [ "$_addr" != "" ]
    then
        echo "$_addr" > ~/.nasm_vm_address.txt
    fi
}

if [ -f ~/.nasm_vm_address.txt ]
then
    :
else
    bad_addr
fi

while ! (_nasm=$(ssh -o ConnectTimeout=1 user@$(cat ~/.nasm_vm_address.txt) cat ping))
do
    bad_addr
done


