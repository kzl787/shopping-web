# 购物网站 http://119.29.89.110:8883/
李凯洲 201930341496 

该网站采用的是MVC模式开发的网站，代码内部逻辑比较清晰，模块之间耦合度低。 

开发环境：JDK 1.16.0.2， Tomcat 9.0.54， mysql-8.0.27-winx64 

开发工具：IDEA，jquery-1.5.1，c3p0-0.9.2, commons-dbutils-1.4等

注：该项目所需要的jar包请到百度网盘中下载：

链接: https://pan.baidu.com/s/1uGwkZEWo8vhG4pUukJrtsg 提取码: 86sk 

1.系统设计：

1.1 系统整体设计模型采用MVC模型，采用该模型能使项目模块之间的耦合度降低，各个部分的任务明确。

1.2 系统整体架构： 视图：页面主要采用jsp页面来展示，虽然页面采用jsp来展示，但并不会在jsp中进行任何的业务逻辑操作，只进行数据的展示和提交。 采用link链接的方式给每个页面给设计对应的css和js样式。

控制器：主要采用继承BaseServlet类（该类继承了HttpServlet，在类主要功能：设置响应的编码，并提取页面请求中的method参数的值，并调用对应的方法，再根据方法返回的字符串选择不同的响应方式。）的来实现，类中主要实现模块中对不同请求的处理方法。

模型：模型分为业务逻辑层Service和对数据库的操作层Dao主要完成给对应模块的业务操作，如查询数据库、封装对象，异常处理等。其中对数据库操作是调用dao层中的方法，业务逻辑层不对数据库进行直接操作。 每个模块的代码结构如右图：
过滤器：程序一共有三个过滤器，一是对请求和相应字符串进行过滤，一是顾客页面的过滤器：顾客需登录后才可访问订单和购物车；另外一个是后台管理过滤器：管理人员需登录后才可访问后台资源。

1.3整个系统可分为两个大模块：展示给顾客的前台系统（客户端）和销售管理的后台系统（销售管理）。

1.3.1客户端：

  1.登录模块：主要实现用户输入用户名和密码的输入合法性的校验（长度≥3，≤20），用户的用户名和密码是否匹配，用户是否已激活。

  2.注册模块：用户在注册时页面会同步调用输入框的对应的请求方法检测输入的合法性，包括用户名是否重复，邮箱是否被注册，以及防止机器注册使用验证码校验，但用户提交时进行表单校验，校验合法时写入数据库，同时发送给客户邮箱，完成最后的激活。

  3.分类模块：页面左侧的分类列表，分类共有两级，每个分类有唯一的编号，点击每一个二级分类会出现对应商品。

  4.图书模块：在图书列表中，当点击图片或者商品名称时，系统将会更具图书的编号查询对应商品，并跳转到相应的到对应的商品详情页（对应下左图）。当点击发行者名字或出版社时，系统会根据对应中文进行模糊搜索，展示相同的发行者或出版社的商品。（对应下右图）。

上图是查询发行商是百度时对应的商品列表。 图书详情页：
购物车模块：购物车中展示了顾客所有购买的商品，顾客可以选择购物车中商品进行结算，同时可以修改商品的数量或者删除购物车中的商品，在购物车的下方会显示结算的价格。 
5.订单模块：在导航栏中，用户可以查看自己所提交的所有订单，订单页的信息如下： 
用户可以点击不同的按钮进如不同的订单详情页，对订单进行操作，如付款，确认收货，取消订单）。 ![image](https://user-images.githubusercontent.com/94117475/144801821-f1d65b48-cab7-4b7a-b834-965ef3f5e900.png)

当用户点击结算时，进入提交订单页，该页会显示订单的详细信息，并且会让用户填写收货地址。，点击提交订单后，系统自动生成订单（订单可在我的订单实时查看）。 
1.3.2销售：
     1.登录模块：管理人员需输入用户名和密码才可访问后台网站，登录界面只是对用户名和密码进行校验。

   2.商品管理模块：商品列表页与前台具有相同的功能，此外管理员可以商品进行增删改的操作。
添加： 点击图书详情页左上角时可修改或删除商品（删除时会附带删除商品图片）：2.订单管理模块：管理员可查看所有用户的订单，并可对订单状体进行修改：发货：当订单状态变为发货状态，商家会发送邮件给客户提醒收货；客户为付款时可取消订单。
![image](https://user-images.githubusercontent.com/94117475/144801765-ba2a118d-abbf-455a-9c13-72df162550b8.png)

此外，系统还提供给管理员按订单状态进行查询。（如下，是查询所有未发货订单）
![image](https://user-images.githubusercontent.com/94117475/144801850-e980c37b-ac8e-4a77-ae3d-b42a182c090f.png)

2.其它功能：分页功能，分页实现是通过传递分页对象，在分页对象中设置对应的实例对象列表。 

3.代码实现 2.1客户端 1.登录流程如下：
![image](https://user-images.githubusercontent.com/94117475/144802125-15bd687d-c4c0-4ef2-88d6-3acf43f0a3b1.png)

2注册流程： ![image](https://user-images.githubusercontent.com/94117475/144802173-f395d3f6-ed2f-4d8e-813a-92fe335ef7df.png)

2.获取分类过程： ![image](https://user-images.githubusercontent.com/94117475/144802182-10152e93-d56e-4bd6-8e22-6e4fda1917a0.png)

3.获取对应分类的商品列表流程： ![image](https://user-images.githubusercontent.com/94117475/144802200-1df45b1c-d060-46d8-a203-a73792d6a8e1.png)

4.模糊查询实现流程：（以书名为例） ![image](https://user-images.githubusercontent.com/94117475/144802159-8f06dd3a-923d-4e03-af4d-87c53b887c70.png)

5.订单查询流程： ![image](https://user-images.githubusercontent.com/94117475/144802212-5bb6c02f-1bfd-475e-807c-94269357aea5.png)

6.生成订单： ![image](https://user-images.githubusercontent.com/94117475/144802225-3607039e-fabb-4c3a-b681-308169c0e849.png)

7.用户查询订单： ![image](https://user-images.githubusercontent.com/94117475/144802248-5bf2bdd5-898f-4eef-aee0-73bc1ba829da.png)

8.生成购物车： ![image](https://user-images.githubusercontent.com/94117475/144802255-803d0d5a-02bf-43c7-9c36-6d678aee350f.png)

2.2后台管理

1.登录功能：系统根据提交表单对用户名和密码进行校验。

2.商品管理功能： 2.1添加商品： ![image](https://user-images.githubusercontent.com/94117475/144802267-67a2b663-ac02-4e34-9714-1a3b27428d2f.png)
2.2修改商品信息：将商品信息表单全部提交，将对应商品除了编号外修改为表单中的内容。

2.3删除商品：根据获取到商品id查询删除该商品，并删除对应磁盘的文件

3.订单管理功能：

查询所有订单:请阅读相关模块代码

按状态查询订单：请阅读相关模块代码

实质上关于订单查询的功能，代码结构基本差不多，区别在与查询的条件子句有所不同

发货流程：![Uploading image.png…]()

以上只列出了重要功能的实现过程，其它功能省略，详细情况可查看各个模块的servlet文件。
