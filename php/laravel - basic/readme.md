# 本文介绍laravel的标准包安装

1. 如果还没有安装wamp，请移步wamp安装教程，里面提到的php扩展包也最好都装一下。
2. 如果机器上没有安装composer，那去下一个 https://getcomposer.org/Composer-Setup.exe ，并安装。装完后开个cmd```composer --version```看一下，如果正常就算装好了。
3. 中国玩家执行```composer config -g repo.packagist composer https://packagist.phpcomposer.com```。 这是在修改下载代理位置到中国区全量镜像，官方的机器在国外然后国内就连不上。。
4. 按教程下载安装包 ```composer global require "laravel/installer"```
5. 将laravel命令添加到路径。4执行时输出的第一句会是```Changed current directory to C:/...（此处为composer本地cache路径）/Composer```，其下 /vendor/bin 文件夹就是laravel命令所在位置。加完后需要重开cmd才能使path生效。
6. 新建标准项目 ```laravel new demo``` ，这样cmd目前位置下会新多一个叫“demo”的文件夹。这里项目名可以自选。
7. cmd定位到demo文件夹，执行 ```composer install -vvv``` 安装所需的包。大约30M。
8. ```copy .env.example .env```
9. ```php artisan key:generate```
10. 修改wamp启动路径到 demo/public，然后就可以在localhost里看到一个laravel的裸主页了。