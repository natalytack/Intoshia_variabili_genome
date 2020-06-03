f = open("*.gff", "r") 
s = f.readlines()
s.reverse()
f.close()

str_elements = 0
w = open("*.txt", "w")
for lines in s:
    if "gene" in lines:
        w.write("gene" + '\t' + str(str_elements) +'\n')
        intron = 0
                
    if "str_elements" in lines:
        str_elements += 1
    
w.close() 
