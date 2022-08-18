# Installing my ubuntu fast
RED='\033[0;31m'
NC='\033[0m'
printf "😂😂😂😂 ${RED} apt update && apt upgrade 😂😂😂😂\n${NC}"
sudo apt update && sudo apt upgrade
printf "😂😂😂😂 ${RED} Basics + CURL + zsh + git + Golang 😂😂😂😂\n${NC}"
sudo apt install software-properties-common apt-transport-https wget zsh curl git golang -y
printf "😂😂😂😂 ${RED} Installing Oh-My-Zsh 😂😂😂😂\n${NC}"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
printf "😂😂😂😂 ${RED} Installing VScode 😂😂😂😂\n${NC}"
wget -O- https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor | sudo tee /usr/share/keyrings/vscode.gpg
echo deb [arch=amd64 signed-by=/usr/share/keyrings/vscode.gpg] https://packages.microsoft.com/repos/vscode stable main | sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt update
sudo apt install code -y

printf "😂😂😂😂 ${RED} Setup for Docker 😂😂😂😂\n${NC}"
sudo apt-get install ca-certificates gnupg lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

printf "😂😂😂😂 ${RED} Installing Docker 😂😂😂😂\n${NC}"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo apt-get install docker-ce=5:20.10.17~3-0~ubuntu-jammy docker-ce-cli=5:20.10.17~3-0~ubuntu-jammy containerd.io docker-compose-plugin
printf "😂😂😂😂 ${RED} Testing Docker 😂😂😂😂\n${NC}"
sudo docker run hello-world
printf "😂😂😂😂 ${RED} Installing Docker-Machine 😂😂😂😂\n${NC}"
curl -L https://github.com/docker/machine/releases/download/v0.16.2/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine &&
    chmod +x /tmp/docker-machine &&
    sudo cp /tmp/docker-machine /usr/local/bin/docker-machine

