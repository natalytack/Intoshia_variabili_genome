import re
with open('*.keg') as f:
    w = None
    count_genes = None
    for line in f:
        line = line.strip()
        if line.startswith('A'):
            if w is not None:
                w.write(str(len(count_genes)) + '\n')
                count_genes = None
                w.close()
            w = open(' ' + line[6:],'w')
        if line.startswith('C'):
            if count_genes is not None:
                w.write(str(len(count_genes)) + '\n')
            w.write(re.match(r'(C +[0-9]+ +)(.+?)(\[?$)',line).group(2).split('[')[0] +
                    '\t')
            count_genes = set()
        if line.startswith('D'):
            count_genes.add(line.split(' ')[7])
    w.write(str(len(count_genes)) + '\n')
    w.close()
