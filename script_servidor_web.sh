#!/bin/bash

echo "Atualizando o Servidor"

apt-get update
apt-get upgrade -y
apt-get install apache2 -y
apt-get install unzip -y

echo "Baixando e Copiando os Arquivos das Aplicacoes"

wget https://github.com/Vst-Byte/Projeto-Site-Pessoal/archive/refs/heads/main.zip
unzip main.zip
cd Projeto-Site-Pessoal-main
cp -R * /var/www/html/
