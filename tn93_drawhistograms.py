#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon May  4 16:34:59 2020

@author: Alexander G Lucaci

"""


#Imports
import scipy.stats as st
from matplotlib.pyplot import figure
import sys, os
import matplotlib.pyplot as plt

#directory = "../analysis/Alignments/MERS/nucleotide/parsed_for_GARD/tn93_version"
output_dir = "tn93_histos"

if not os.path.exists(output_dir):
    os.makedirs(output_dir)
# =============================================================================
# Helper functions
# =============================================================================
    
def plot(values, each_file, virus):
    plt.figure(figsize=[10,8])
    plt.rcParams.update({'figure.figsize':(10,6), 'figure.dpi':100})
    kwargs = dict(alpha=0.5, bins=100)
    x = values
    plt.hist(x, bins=30)
    title = virus + " TN93 Values: " + each_file
    plt.gca().set(title=title, ylabel='Number of Occurences', xlabel='TN93 Pairwise distance scores');
    plt.savefig('tn93_histos/' + virus + "_" + each_file + ".png")
    
#end method: plot


def main(dst_file, each_file, virus):
    pairwise_scores = []
    
    with open(dst_file) as fh:
        for n, line in enumerate(fh):
            if n == 0: continue # skip header
            data = line.strip().split(",") #assumes csv format.
            
            #print(data)
            pairwise_scores += [float(data[2])]
        #end for
    #end with
    # print(pairwise_scores)
    plot(pairwise_scores, each_file, virus)
    
    
#end method


for virus in ["MERS", "SARS", "SARS2"]:
    directory = "../analysis/Alignments/"+virus+"/nucleotide/tn93"
    print("# Checking:", directory)
    for root, dirs, files in os.walk(directory):
            #print(root, dirs, files)
            #continue
            for each_file in files:
                if ".dst" not in each_file: continue
                if "tn93" not in each_file: continue
                print("\tProcessing:", each_file)
                name, ext = os.path.splitext(each_file)
                input_dst = os.path.join (root, name + ext)    
                main(input_dst, each_file, virus)
                #sys.exit(1)
            #end second inner for
    #end inner for
#end outer for

            
