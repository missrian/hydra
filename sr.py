import re 

f = open(r"seeResult.txt","r")
lines = f.readlines()

for line in lines:
    result2 = re.findall('host',line)

    if not result2 == []:
        with open(r"pentest.txt","a+") as w:
            w.write(line)

