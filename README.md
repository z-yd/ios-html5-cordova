iOS+html5+cordova

简述：
之前的项目中需要iOS、html5、cordova进行交互，在查了网上的很多东西，耗费了很多的时间终于解决了问题，所以在这里总结一下，希望可以帮助到大家，如有问题希望指正。

一、用windows7虚拟mac系统

可以参考http://blog.csdn.net/luyongy/article/details/52164329

二、mac系统升级

如果按照上面安装之后mac版本不是最新版本，也就不能使用新版本的xcode了，如果想使用最新版本的xcode,那么必须就要升级mac版本了，直接点击App Store更新系统

三、安装xcode

   在App Store中搜索xcode进行安装，如果安装时需要Apple ID，请到苹果官网注册。
   
四、windows和mac文件共享

   点击Finder---应用程序---系统偏好设置---共享
   
   接下来请勾选“文件共享”选项，在这个界面中还可以看到自己的 IP 地址。然后在Windows上面输入共享地址，输入用户、密码就可以共享文件了。
   
五、cordova安装和使用

   1.在终端输入npm install -g cordova 即可安装Cordova。
   
   2.用命令创建cordova工程
   
     a. Cordova create hello
     
     B.然后cd  hello
     
     c.添加app支持平台，cordova platform add ios
     
     d.运行app:  cordova  run ios 也可以直接打开工程文件，点击hello.xcodeproj
     

六、cordova、ios、h5交互将会在demo中给出。
   1.在config.xml中配置弹框
        
   2.创建自己的插件
      自定义插件需要在Plugins目录下创建，名字可以随意
   3.config.xml里面配置创建好的插件
     
   4.ios使用AFNetworking插件请求数据
AFNetworking可以百度搜索下导入方法，也可以直接使用demo中的AFNetworking


注：如需查看代码请到demo中查看
