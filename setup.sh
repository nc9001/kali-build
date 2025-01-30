#!/usr/bin/bash

long='==============================================================================================================================='
medium='=================================================================='
short='========================================'

RED='\033[1;31m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
NC='\033[0m'

export long
export medium
export short

export RED
export YELLOW
export BLUE
export NC


f_banner(){
echo
echo -e "${RED}
kali-build
                                                                        
${NC}"
echo
echo
}

export -f f_banner

f_download(){

echo -e "${BLUE}[*]git clone...${NC}"
echo -e "${BLUE}$medium${NC}"

git clone --depth 1 https://github.com/PowerShellMafia/PowerSploit /opt/PowerSploit
git clone --depth 1 https://github.com/swisskyrepo/PayloadsAllTheThings.git /opt/PayloadsAllTheThings
git clone --depth 1 https://github.com/S3cur3Th1sSh1t/PowerSharpPack.git /opt/PowerSharpPack
git clone --depth 1 https://github.com/Flangvik/SharpCollection.git /opt/SharpCollection
git clone --depth 1 https://github.com/itm4n/PrivescCheck.git /opt/PrivescCheck
git clone --depth 1 https://github.com/urbanadventurer/username-anarchy.git /opt/username-anarchy
git clone --depth 1 https://github.com/dirkjanm/BloodHound.py.git /opt/BloodHound.py
git clone --depth 1 https://github.com/AlmondOffSec/PassTheCert.git /opt/PassTheCert
git clone --depth 1 https://github.com/internetwache/GitTools.git /opt/GitTools
git clone --depth 1 https://github.com/bitsadmin/wesng.git /opt/wesng
git clone --depth 1 https://github.com/samratashok/nishang.git /opt/nishang
git clone --depth 1 https://github.com/Greenwolf/ntlm_theft.git /opt/ntlm_theft
git clone --depth 1 https://github.com/byt3bl33d3r/CrackMapExec /opt/cme
git clone --depth 1 https://github.com/ly4k/Certipy /opt/Certipy
git clone --depth 1 https://github.com/fortra/impacket /opt/impacket
git clone --depth 1 https://github.com/dirkjanm/krbrelayx /opt/krbrelayx

#decompress rockyou
gzip -d -k /usr/share/wordlists/rockyou.txt.gz

echo -e "${BLUE}[*]complete${NC}"
echo -e "${BLUE}$medium${NC}"

echo -e "${BLUE}[*]file download...${NC}"
echo -e "${BLUE}$medium${NC}"

#PEASS-ng
wget -P /opt/PEASS-ng 'https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh'
wget -P /opt/PEASS-ng 'https://github.com/carlospolop/PEASS-ng/releases/latest/download/winPEAS.bat'
wget -P /opt/PEASS-ng 'https://github.com/carlospolop/PEASS-ng/releases/latest/download/winPEASx64.exe'
wget -P /opt/PEASS-ng 'https://github.com/carlospolop/PEASS-ng/releases/latest/download/winPEASany.exe'
#pspy
wget -P /opt/pspy 'https://github.com/DominicBreuker/pspy/releases/latest/download/pspy32s'
wget -P /opt/pspy 'https://github.com/DominicBreuker/pspy/releases/latest/download/pspy64s'
wget -P /opt/pspy 'https://github.com/DominicBreuker/pspy/releases/latest/download/pspy64'
#Download binary from github repo
wget -P /opt/kerbrute 'https://github.com/ropnop/kerbrute/releases/latest/download/kerbrute_linux_amd64'
wget -P /opt/SharpHound 'https://github.com/BloodHoundAD/BloodHound/raw/master/Collectors/SharpHound.exe'
wget -P /opt/mimikatz 'https://github.com/gentilkiwi/mimikatz/releases/latest/download/mimikatz_trunk.7z'
wget -P /opt/chisel 'https://github.com/jpillora/chisel/releases/download/v1.9.1/chisel_1.9.1_linux_amd64.gz'
wget -P /opt/chisel 'https://github.com/jpillora/chisel/releases/download/v1.9.1/chisel_1.9.1_windows_amd64.gz'
wget -P /opt/Cutter 'https://github.com/rizinorg/cutter/releases/download/v2.1.2/Cutter-v2.1.2-Linux-x86_64.AppImage'
wget -P /opt/ghidra 'https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_11.0.1_build/ghidra_11.0.1_PUBLIC_20240130.zip'
wget -P /opt/chainsaw 'https://github.com/WithSecureLabs/chainsaw/releases/latest/download/chainsaw_all_platforms+rules.zip'
wget -P /opt/obsidian 'https://github.com/obsidianmd/obsidian-releases/releases/download/v1.5.11/Obsidian-1.5.11.AppImage'
wget -P /opt/RunasCs 'https://github.com/antonioCoco/RunasCs/releases/latest/download/RunasCs.zip'
wget -P /opt/jd 'https://github.com/java-decompiler/jd-gui/releases/download/v1.6.6/jd-gui-1.6.6.jar'

echo -e "${BLUE}[*]complete${NC}"
echo -e "${BLUE}$medium${NC}"

}

export -f f_download

f_install(){

echo -e "${BLUE}[*]tool install...${NC}"
echo -e "${BLUE}$medium${NC}"

#TODO: install docker-ce
#https://www.kali.org/docs/containers/installing-docker-on-kali/
apt install -y gobuster
apt install -y bloodhound
apt install -y feroxbuster
apt install -y jq
apt install -y xxd
apt install -y gdb
apt install -y python3.11-venv
apt install -y ntpdate
apt install -y xclip

#rustscan
wget -P /tmp/rustscan 'https://github.com/RustScan/RustScan/releases/download/2.0.1/rustscan_2.0.1_amd64.deb'
dpkg -i /tmp/rustscan/rustscan_2.0.1_amd64.deb

# install golang
wget https://go.dev/dl/go1.22.5.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.22.5.linux-amd64.tar.gz

#add alias .zshrc
echo "# add this" >> ~/.zshrc
echo "alias code='sudo -u kali code'" >> ~/.zshrc
echo "alias xclip='xclip -selection clipboard'" >> ~/.zshrc
echo "alias venv='python3 -m venv .venv && source .venv/bin/activate'" >> ~/.zshrc
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.zshrc
cp vimrc ~/.vimrc
cp tmux.conf ~/.tmux.conf

echo -e "${BLUE}[*]complete${NC}"
echo -e "${BLUE}$medium${NC}"

}

export -f f_install

f_update(){

echo -e "${BLUE}[*]tool update...${NC}"
echo -e "${BLUE}$medium${NC}"

wpscan --update
searchsploit --update
nmap --script-updatedb

echo -e "${BLUE}[*]complete${NC}"
echo -e "${BLUE}$medium${NC}"

}

f_addon(){
# install firefox addon

echo -e "${BLUE}[*]install firefox addon${NC}"

echo -e "${BLUE}[*]download addon...${NC}"
echo -e "${BLUE}$medium${NC}"

mkdir /tmp/addon

wget 'https://addons.mozilla.org/firefox/downloads/file/3616824/foxyproxy_standard-7.5.1.xpi' -O /tmp/addon/foxyproxy.xpi
wget 'https://addons.mozilla.org/firefox/downloads/file/3993587/wappalyzer-6.10.39.xpi' -O /tmp/addon/wappalyzer.xpi
wget 'https://addons.mozilla.org/firefox/downloads/file/4003085/retire_js-1.7.1.xpi' -O /tmp/addon/retire_js.xpi
wget 'https://addons.mozilla.org/firefox/downloads/file/3922535/simple_modify_header-1.8.1.xpi' -O /tmp/addon/simple_modify_header.xpi
wget 'https://addons.mozilla.org/firefox/downloads/file/3755764/cookie_editor-1.10.1.xpi' -O /tmp/addon/cookie_editor.xpi
wget 'https://addons.mozilla.org/firefox/downloads/file/4208970/deepl_translate-1.12.3.xpi' -O /tmp/addon/deepl_translate.xpi

#install 
echo -e "${BLUE}[*]install addon...${NC}"
echo -e "${BLUE}$medium${NC}"

su kali -c "firefox /tmp/addon/*.xpi"

echo -e "${BLUE}[*]complete${NC}"
echo -e "${BLUE}$medium${NC}"

}

f_demo(){
#function check
while true
do
    echo -e "${YELLOW}$medium${NC}"
    echo -e "${YELLOW}[*]Demo mode${NC}"
    echo "1. banner"
    echo "2. install"
    echo "3. download"
    echo "4. update"
    echo "5. addon"
    echo "9. exit"
    echo
    echo -n "Choice: "
    read choice
    case $choice in
        1) f_banner ;;
        2) f_install ;;
        3) f_download ;;
        4) f_update ;;
        5) f_addon ;;
        9)
            echo -e "${YELLOW}[*]End Demo${NC}"
            echo -e "${YELLOW}$medium${NC}"
            exit
            ;;
        *) echo -e "${RED}Invalid...${NC}" ;;
    esac
done
}

export -f f_demo

main(){
#check already apt update

echo -n -e "${BLUE}Do Apt update? [Y/n]: ${NC}"
read ans

case $ans in
    [yY])
        echo -e "${RED}[!]Start install!${NC}"
        clear
        f_banner
        f_install
        f_download
        f_addon
        f_update
        exit
        ;;
    [nN]|[qQ])
        echo -e "${RED}[!]Please update!${NC}"
        exit
        ;;
    [dD])
        echo -e "${RED}[*]Start demo mode${NC}"
        f_demo
        exit
        ;;
    *)
        echo -e "${RED}[!]Invalid...${NC}"
        exit
        ;;
esac
}

export -f main

while true; do main; done
