import re

f = open(r"/root/2/output.txt","r")
lines = f.readlines() 

for line in lines:
     result2 = re.findall('[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}',line)
     result3 = re.findall('open',line)

     if  result2 == [] and result3 == []:
        print("no ip in this line")

     elif  not result3 == []:
         status = result3[0] + '\n'
         with open(r"/root/2/result.txt", "a+") as w:
             w.write(status)
     else:
        print (result2[0])
        if not result2 == []:
            result = result2[0] + '\n'
            with open(r"/root/2/result.txt", "a+") as w:
                w.write(result)


f2 = open(r"/root/2/result.txt","r")
lines2 = f2.readlines()
i = 1
strr  = ''
for line in lines2:
    result4 = re.findall('[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}', line)
    if not result4 == []:
            strTemp = result4[0]

    else:
            strr = strr + strTemp + '\n'
            i += 1

print (i)
i= str(i)
pnum = "there are " + i + " localhosts up"

with open(r"/root/2/result2.txt", "a+") as w:
    w.write(strr)
    w.write(pnum)

