# Provisionamento e Configuração da Infraestrutura (VM Ubuntu Server)

Documentação dos comandos utilizados na configuração da Máquina Virtual (Oracle VM VirtualBox com Ubuntu Server), servidor web Apache, banco de dados MySQL, interface phpMyAdmin e rede privada virtual Tailscale.

---

## 1. Instalação da Pilha LAMP (Linux, Apache, MySQL, PHP e phpMyAdmin)

    # 1. Atualizar os repositórios do Ubuntu
    sudo apt update && sudo apt upgrade -y

    # 2. Instalar o servidor Web Apache
    sudo apt install apache2 -y

    # 3. Instalar o banco de dados MySQL Server
    sudo apt install mysql-server -y

    # 4. Instalar o PHP e os módulos necessários para o phpMyAdmin e MySQL
    sudo apt install php libapache2-mod-php php-mysql php-mbstring php-zip php-gd php-json php-curl -y

    # 5. Instalar o phpMyAdmin
    sudo apt install phpmyadmin -y

    # 6. Ativar o módulo mbstring no PHP e reiniciar o Apache
    sudo phpenmod mbstring
    sudo systemctl restart apache2

---

## 2. Configuração de Acesso e Privilégios no MySQL

    -- Acessar o MySQL com permissões de root no Linux: sudo mysql

    -- Criar o utilizador 'admin' com autenticação por palavra-passe
    CREATE USER 'admin'@'localhost' IDENTIFIED BY '********';

    -- Conceder privilégios na base de dados do projeto (Princípio do Menor Privilégio)
    GRANT ALL PRIVILEGES ON `healthTech_banco_de_dados`.* TO 'admin'@'localhost';

    -- Aplicar as alterações de permissões e sair
    FLUSH PRIVILEGES;
    EXIT;

---

## 3. Instalação e Configuração da VPN Tailscale (Servidor VM)

    # 1. Ajustar data/hora para validação de certificados e pacotes
    sudo date -s "2026-10-06 17:00:00"

    # 2. Instalar o cliente oficial Tailscale
    curl -fsSL [https://tailscale.com/install.sh](https://tailscale.com/install.sh) | sh

    # 3. Iniciar o serviço e autenticar o nó na rede privada
    sudo systemctl enable --now tailscaled
    sudo tailscale up --reset

    # 4. Consultar o IP privado atribuído à VM na VPN
    tailscale ip -4
    tailscale status

---

## 4. Configuração do Cliente Tailscale nas Estações de Trabalho (Linux)

    # 1. Instalar o pacote oficial do Tailscale (exemplo em ambiente Arch Linux)
    sudo pacman -S tailscale

    # 2. Ativar e iniciar o daemon do Tailscale
    sudo systemctl enable --now tailscaled

    # 3. Autenticar na mesma rede privada da HealthTech
    sudo tailscale up

---

## 5. Troubleshooting — Correção de Tabelas pma__ no phpMyAdmin

    # 1. Abrir o ficheiro de configuração do phpMyAdmin
    sudo nano /etc/phpmyadmin/config.inc.php

    # 2. Desativar o rastreamento avançado (tracking) para eliminar alertas de tabelas pma__ ausentes:
    # $cfg['Servers'][$i]['tracking'] = false;

    # 3. Reiniciar o Apache para aplicar a alteração
    sudo systemctl restart apache2
