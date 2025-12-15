# Script de Provisionamento de Servidor Web (Apache2)

Este repositório contém um shell script (`script.sh`) desenvolvido para automatizar o processo de provisionamento de um servidor web em distribuições Linux baseadas em Debian/Ubuntu.

O script realiza a atualização do sistema, instalação do servidor web Apache, instalação de dependências e o deploy automático de uma aplicação web estática a partir de um repositório remoto.

## 🚀 O que este script faz?

Ao ser executado, o script realiza as seguintes tarefas sequenciais:

1.  **Atualização do Sistema:** Executa `apt-get update` e `apt-get upgrade` para garantir que o servidor esteja com os pacotes mais recentes.
2.  **Instalação de Serviços:**
    * **Apache2:** O servidor web.
    * **Unzip:** Utilitário para descompactar os arquivos da aplicação.
3.  **Download da Aplicação:** Baixa o código fonte do repositório `Arquivo.zip do GITHUB` (branch main).
4.  **Deploy:** Descompacta o arquivo baixado e copia todos os arquivos para o diretório raiz do Apache (`/var/www/html/`), tornando o site acessível imediatamente.

## 📋 Pré-requisitos

* Um sistema operacional Linux baseado em Debian (ex: Ubuntu, Debian, Kali Linux, Mint).
* Acesso à internet no servidor.
* Privilégios de superusuário (**Root**) ou acesso via `sudo`.

## ⚙️ Como executar

Siga os passos abaixo para rodar o script no seu servidor:

### 1. Clone o repositório ou crie o arquivo
Se você já tem o arquivo, pule para o passo 2. Caso contrário, crie um arquivo chamado `script.sh` e cole o conteúdo.

### 2. Dê permissão de execução
Antes de rodar, é necessário tornar o script executável:

```bash
chmod +x script.sh
```
### 3 Execute o script
Como o script realiza instalações de pacotes, ele deve ser rodado como root (sudo):
```bash
sudo ./script.sh
```

⚠️ Nota Importante
Este script substitui o conteúdo da pasta /var/www/html/. Certifique-se de que não há arquivos importantes nessa pasta antes de executar o script, ou eles serão sobrescritos pelos arquivos da aplicação.

🛠 Tecnologias Utilizadas

- Shell Script (Bash)

- Apache2

- Git/GitHub (como fonte dos arquivos)
