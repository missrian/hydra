# hydra

#安装依赖
<<<<<<< HEAD
yum install -y openssl-devel pcre-devel ncpfs-devel postgresql-devel libssh-devel subversion-devel libncurses-devel mysql-devel
=======

yum install openssl-devel pcre-devel ncpfs-devel postgresql-devel libssh-devel subversion-devel libncurses-devel mysql-devel
>>>>>>> 1b408d928d481a3184d1f133529cbf981cee14c3

安装hydra和nmap

yum install -y hydra nmap 

#执行
<<<<<<< HEAD
mv hydra-master/ 2/
mv 2/ /root/

=======

mv hydra-master/ 2/

mv 2/ /root/
>>>>>>> 1b408d928d481a3184d1f133529cbf981cee14c3

./nmap.sh


查看扫描出来的弱密码

cat pentest.txt


