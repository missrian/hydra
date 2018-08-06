#！ /bin/bash

original_dir=$(pwd)
shell_dir=$(cd "$(dirname "$0")"; pwd)

cd ${shell_dir}

read -p "请输入扫描ip端，如果172.20.15.0/24或者172.20.0.0/16:" ip
expr $ip + 1 &>/dev/null


##ip 段
#ip=172.20.15.0/24

#ip=172.20.0.0/16

function nmap_mysql(){
 > output.txt
nmap -sS $ip -p3306 -o output.txt
}

function nmap_ssh(){
 > output.txt
nmap -sS $ip -p22 -o output.txt
}

function nmap_redis(){
 > output.txt
nmap -sS $ip -p6379 -o output.txt

}


function hydra_ssh () {

cat result2.txt | while read line
do

echo $line

hydra -l root  -P top100.txt  ${line} ssh >> seeResult.txt
#hydra -l root -P top100.txt ssh:${line}  >>  seeResult.txt
echo -e “ ----------------------------next ip test-------------------------------\n\n-” >> seeResult.txt

done
}


function hydra_mysql () {

cat result2.txt | while read line
do

echo $line

hydra -l root  -P top100.txt -t 16 -f -vV -e ns ${line} mysql >> seeResult.txt
#hydra -l root -P top100.txt ssh:${line}  >>  seeResult.txt
echo -e “ ----------------------------next ip test-------------------------------\n\n-” >> seeResult.txt

done
}



function hydra_redis () {

cat result2.txt | while read line
do

echo $line

hydra -P top100.txt -f -t 16 -vV -e ns redis://${line} >>  seeResult.txt
#hydra -l root  -P top100.txt -t 16 -f -vV -e ns ${line} mysql >> seeResult.txt
#hydra -l root -P top100.txt ssh:${line}  >>  seeResult.txt
echo -e “ ----------------------------next ip test------------------------------\n\n-” >> seeResult.txt

done
}




# 函数，显示菜单
function select_menu(){

echo -e "\033[0;36m-- 端口探测 --\033[0m"
echo -e "\033[0;36m 1 探测ssh 22端口 \033[0m"
echo -e "\033[0;36m 2 探测mysql 3306端口 \033[0m"
echo -e "\033[0;36m 3 探测redis 6379端口 \033[0m"

}

# 函数，选择部署范围
function select_num()
{

echo -n -e "\033[0;36m请选择需要部署的服务，输入序号 [0-6]: \033[0m"
read num
expr ${num} + 1 > /dev/null 2>&1
# 输入是否为数字
if [ $? -ne 0 ] ; then
  echo "超出范围，请重新输入"
  select_num
# 数字过小
elif [ "${num}" -lt 0 ] ; then
  echo "超出范围，请重新输入"
  select_num
# 数字过大
elif [ "${num}" -gt 6 ] ; then
  echo "超出范围，请重新输入"
  select_num

# 输入为0
elif [ "${num}" == 1 ] ; then
  echo "探测ssh 22端口"
  nmap_ssh

> result.txt
>result2.txt

/usr/bin/python out.py

>  seeResult.txt
hydra_ssh


> pentest.txt
/usr/bin/python sr.py

# 输入为0
elif [ "${num}" == 2 ] ; then
  echo "探测mysql 3306端口 "
  nmap_mysql

> result.txt
>result2.txt
/usr/bin/python out.py

>  seeResult.txt
hydra_mysql

> pentest.txt
/usr/bin/python sr.py

# 输入为0
elif [ "${num}" == 3 ] ; then
  echo "探测redis 6379端口"
  nmap_redis

> result.txt
>result2.txt
/usr/bin/python out.py

>  seeResult.txt
hydra_redis

> pentest.txt
/usr/bin/python sr.py

fi
}


# 目录
select_menu
# 选择
select_num





