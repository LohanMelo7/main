#!/bin/bash
# script teste

reuse="\e[1m[\e[94m+\e[0m\e[1m]\e[94m"
clear

# Verificação de OS(Sistema operacional)
if [[ "$OSTYPE" != "linux-gnu" && "$OSTYPE" != "linux-android" ]];then
    echo -e "$reuse Seu sistema operacional não é Linux, verifique as instruções para download para $OSTYPE\e[0m"
    exit
fi

# Atualização do apt
clear
echo -e "$reuse Atualizando apt\e[0m"
sleep 2
clear
apt update
apt upgrade
clear

# Instalação do python e do git
echo -e "$reuse Instalando python\e[0m"
sleep 2
echo -e "$reuse $(python --version) já está instalado\e[0m" && sleep 2 || apt install python -y
clear

# Instalação das bibliotecas necessarias
echo -e "$reuse Instalando bibliotecas necessarias\e[0m"
sleep 2
pip install requests
clear

# Pasta do paineldomago
if [[ -d paineldomago/ ]]; then
  echo -e "$reuse Criação da pasta principal ignorada pois já existe\e[0m"
else
  mkdir paineldomago
fi
cd paineldomago
sleep 2
clear
if [[ -f paineldomago/main.py ]]; then
  echo -e "$reuse O paineldomago já estava instalado antes, você já pode apagar o arquivo $0\e[0m"
else
  curl -o main.py https://github.com/LohanMelo7/main/blob/main/paineldomago-main/paineldomago-main/main.py
fi
sleep 2
while true; do
    clear
    echo -e "$reuse Deseja iniciar o paineldomago?\e[0m\e[1m [\e[94ms/\e[91mn\e[0m\e[1m]\e[0m"
    read -n 1 opt
    clear
    if [ $opt == "s" ];then
        break
    elif [ $opt == "n" ];then
        exit
    else
        echo -e "\e[1m[\e[91m!\e[0m\e[1m] \e[91mDigite s ou n.\e[0m"
        sleep 2
    fi
done
python main.py
