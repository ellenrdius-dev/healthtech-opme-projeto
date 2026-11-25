# Provisionamento e Configuração da Infraestrutura (VM Ubuntu Server)

Documentação dos comandos utilizados na configuração da Máquina Virtual (Oracle VM VirtualBox com Ubuntu Server), servidor web Apache, banco de dados MySQL, interface phpMyAdmin e rede privada virtual Tailscale.

---

## 1. Instalação da Pilha LAMP (Linux, Apache, MySQL, PHP e phpMyAdmin)

```bash
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
