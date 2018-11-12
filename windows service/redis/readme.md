**windows下redis安装**

本文参考自 https://blog.csdn.net/u012343297/article/details/78839063 ，感谢。

1. github上有不那么新的一键解压包：https://github.com/ServiceStack/redis-windows/tree/master/downloads ，本文件夹里下了最新的那个（也不怎么新了）。官网是 https://redis.io/download 但总打不开，也得自己找windows版，不甚推荐。
2. 解压后修改redis.windows.conf文件， maxmemory 表示分配数据库大小（字节数）， requirepass 表示密码。默认redis port是6379，要改也可以但不推荐。
3. ```redis-server.exe redis.windows.conf``` 启动redis服务。虽然窗口不会自动关闭但显示 started 之后就可以关掉了。
4. redis-cli.exe是redis的命令行终端，可以拿来测试。先 auth xx(刚设置的password) 验证身份，之后就可以开始按[redis手册](http://www.redis.cn/commands.html#sorted_set)上的东西试试看了。
5. 其他语言使用redis请参考语言包下的对应简介
  * [php](http://www.redis.cn/commands.html#sorted_set)