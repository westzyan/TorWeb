# TorWeb
Tor流量分析识别

##使用说明
1、程序基于Java环境，使用的的是jdk1.8，tshark用于处理pcap数据包，版本为2.6.6，环境为Ubuntu，服务器使用的是tomcat7.0
2、可将程序导入到eclipse中，然后关联到tomcat中
3、或者将其导入到eclipse中后生成war包，然后放到tomcat文件夹的webapps下，在浏览器中输入127.0.0.1:8080/torweb即可使用
##程序缺陷
1、可能存在bug
2、处理结果保存在csv文件中，但是写死了，并未改
3、网页中爬虫使用的是PHP展示，故需要安装PHP环境，爬虫代码放到PHP文件夹下
