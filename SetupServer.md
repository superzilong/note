### 搭建服务器流程
1. 在vultr上注册账号，选择Silcon Vally的服务器，选择ubuntu最新的系统
2. passwd 修改密码
3. apt update
4. apt upgrade 更新升级系统
5. apt install zsh 安装zsh terminal
6. https://github.com/robbyrussell/oh-my-zsh 下载oh-my-zsh美化zsh
7. apt install python python-dev python3-dev 安装python开发环境
8. apt install cmake build-essential
9. apt install ranger neofecth
10. ufw app list/ufw status/ufw allow OpenSSH/ufw enable 启动防火墙  过滤SSH
11. apt install apache2
12. ufw allow "Apache Full"
13. vim /var/www/html/index.html
14. https://www.jumpthegreatfirewall.com/