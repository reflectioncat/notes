本文分割线以上的部分，都转自 https://www.cnblogs.com/zhaiqianfeng/p/4622561.html 。感谢。</br>
担心文件过期、网页404之类的原因所以抄来一份。

文中加粗的部分都是字符串变量（代码块里没法加粗，凑合看吧），可自行指定。相同的字符串变量名对应相同的值。

目标：将一个exe注册成名为 <b>custom_service</b> 的windows service，这样可以在锁屏或者远程连接断掉后继续在后台跑。

步骤：
1. 下载 instsrv_srvany.zip ,并解压到比方说 c:\\<b>custom_service_dir</b>\ 。
2. 用管理员模式运行cmd，当前目录切换到刚才放instsrv.exe和srvany.exe的 c:\\<b>custom_service_dir</b>\ 文件夹。
3. ```instsrv custom_service c:\custom_service_dir\srvany.exe ``` 使用instsrv把srvany安装成服务。
4. ```regedit``` 打开注册表管理。
5. 依次展开如下子键:[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services]，在该子键下找到并右击<b>custom_service</b>(对应服务名)，选择“新建”下的“项”，将其命名为Parameters。
6. 单击选定Parameters，在右侧窗口中新建一个名为Application的字符串值，将其数值设置为需要做成服务的exe的绝对路径，比如c:\\<b>custom_service_dir</b>\\<b>test</b>.exe 。
7. 按5里的步骤，新建名为AppDirectory的字符串值，数值为需要做成服务的exe所在的文件夹，比如 c:\\<b>custom_service_dir</b> 。
8. 如果exe需要运行时参数，新建名为AppParameters的字符串值。
9. ```net start custom_service``` 启动服务。
10. 如果要停止服务，```net stop custom_service```。
11. 如果要删掉服务，```sc delete custom_service```。注意之前要先stop。

======== 分割线，以上转自 https://www.cnblogs.com/zhaiqianfeng/p/4622561.html ========

由于每次找注册表项还是比较麻烦，于是做了文中说的“有兴趣的话尝试一下”，鼓捣了个bat出来。

exe安装成服务，代码可以直接下载本文件夹里的 install.bat ，使用前注意修改头上的参数。<br>
跑完会自动生成 delete_<b>custom_service</b>.bat，执行一下就能删除刚装的服务了。

此处另提供 test.exe 供测试。如果成功跑起来了，会在test.exe的文件夹下生成一个test.out，每5秒更新内容为当前时间字符串，例如"2018-11-08 15:20:00"
如果想知道exe里在搞啥，可以参考本文件夹下的test.cpp源码。

======== 各种可能错误及解决方案（按步骤序） ========

* 第2步内出现 ```You are not authorized to do this - please contact your system Administrator``` 的话，是因为cmd没有以管理员身份运行。这个找到cmd.exe的位置，右键后选“以管理员身份运行”重开cmd，在新cmd里操作即可。

* 第9步出现 ```The testService service could not be started. The service did not report an error.```的话，先检查你的exe能否双击正常运行，如果可以的话，windows10下从 属性-安全 拷贝exe完整路径时，可能在头部多一个不显示的字符，注意干掉。