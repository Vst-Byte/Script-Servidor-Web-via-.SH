#!/bin/bash

# --- CONFIGURAÇÃO ---
REPO_URL="https://github.com/Vst-Byte/Projeto-Site-Pessoal/archive/refs/heads/main.zip"
DIR_APACHE="/var/www/html"
NOME_ARQUIVO="main.zip"
PASTA_DESCOMPACTADA="Projeto-Site-Pessoal-main"

# --- 1. VERIFICAÇÃO DE PERMISSÃO ---
# Se o usuário não for root (id 0), o script para.
if [ "$EUID" -ne 0 ]; then
  echo "❌ Por favor, execute como root (sudo ./script.sh)"
  exit 1
fi

echo "🟢 Iniciando provisionamento..."

# --- 2. ATUALIZAÇÃO E INSTALAÇÃO ---
echo "🔄 Atualizando o servidor..."
apt-get update -y > /dev/null 2>&1
apt-get upgrade -y > /dev/null 2>&1

echo "📦 Instalando dependências (Apache2 e Unzip)..."
apt-get install apache2 unzip -y > /dev/null 2>&1

# --- 3. DOWNLOAD E DEPLOY ---
echo "⬇️ Baixando a aplicação..."

# Baixa o arquivo para a pasta temporária /tmp para não sujar o sistema
cd /tmp
wget -q $REPO_URL -O $NOME_ARQUIVO

# Verifica se o download deu certo antes de continuar
if [ $? -ne 0 ]; then
    echo "❌ Erro ao baixar o repositório. Verifique a URL."
    exit 1
fi

echo "📂 Descompactando e copiando arquivos..."
unzip -o $NOME_ARQUIVO > /dev/null 2>&1

# Limpa a pasta do Apache para evitar conflito de arquivos antigos
rm -rf $DIR_APACHE/*

# Copia os arquivos novos
cp -R $PASTA_DESCOMPACTADA/* $DIR_APACHE/

# --- 4. LIMPEZA E FINALIZAÇÃO ---
echo "🧹 Limpando arquivos temporários..."
rm -rf $NOME_ARQUIVO $PASTA_DESCOMPACTADA

echo "🔥 Ajustando permissões e reiniciando serviço..."
# Garante que o usuário do Apache (www-data) seja o dono dos arquivos
chown -R www-data:www-data $DIR_APACHE
systemctl enable apache2
systemctl restart apache2

echo "✅ Provisionamento concluído com sucesso!"
echo "🌐 Acesse pelo IP do servidor."
