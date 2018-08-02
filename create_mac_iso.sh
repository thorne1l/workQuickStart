# https://github.com/geerlingguy/macos-virtualbox-vm


# curl https://raw.githubusercontent.com/geerlingguy/macos-virtualbox-vm/master/prepare-iso.sh -Lo ./prepare-iso.sh
# chmod +x prepare-iso.sh && ./prepare-iso.sh
# ./prepare-iso.sh '/Applications/Install\ macOS\ High\ Sierra.app' '/Users/thorne1l/dev/workQuickStart'
# https://www.macworld.com/article/3204672/macs/how-to-create-a-bootable-macos-high-sierra-installer-drive.html?page=2

VM_NAME='macOS'
VM_OS='MacOS1013_64'

# https://www.perkin.org.uk/posts/create-virtualbox-vm-from-the-command-line.html
VBoxManage createhd --filename $VM_NAME.vdi --size 32768
VBoxManage createvm --name $VM_NAME --ostype $VM_OS --register
VBoxManage storagectl $VM_NAME --name "SATA Controller" --add sata --controller IntelAHCI
VBoxManage storageattach $VM_NAME --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium $VM_NAME.vdi
VBoxManage storagectl $VM_NAME --name "IDE Controller" --add ide
VBoxManage storageattach $VM_NAME --storagectl "IDE Controller" --port 0 --device 0 --type dvddrive --medium ~/Desktop/HighSierra.iso
VBoxManage modifyvm $VM_NAME --ioapic on
VBoxManage modifyvm $VM_NAME --boot1 dvd --boot2 disk --boot3 none --boot4 none
VBoxManage modifyvm $VM_NAME --memory 1024 --vram 128