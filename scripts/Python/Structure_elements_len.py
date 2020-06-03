#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Created on Sat Jun  1 16:20:40 2019

@author: natasha
"""

f = open("/home/natasha/Desktop/Python_train/augustus.gff", "r") 
s = f.readlines()
s.reverse()
f.close()

count_introns = 0
count_genes = 1
w = open("/home/natasha/Desktop/Python_train/length_new.txt", "w")
for i in s:
    a = i.split('\t')
    if a[2] == 'intron':
        length = (int(a[4]) - int(a[3]) + 1)
        w.write('gene' + '\t' + str(count_genes) + '\t' + str(length) + '\n')
        count_introns +=1
    
    if a[2] == 'gene':
        if count_introns == 0:
            w.write('gene' + '\t' + str(count_genes) + '\t' + str(0) + '\n')
        count_introns = 0
        count_genes += 1
w.close()    