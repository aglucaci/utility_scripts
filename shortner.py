#!/usr/bin/env python
# coding: utf-8

# In[1]:


from Bio import SeqIO


# In[6]:


in_fasta = "../Stanhope-Projects/horsecov-Project-3/Spike-analysis/OC43-spike.total.aln.fasta"
out_fasta = "../Stanhope-Projects/horsecov-Project-3/Spike-analysis/OC43-spike.total.test.fasta"
with open (in_fasta, "w") as out:
    
    for rec in SeqIO.parse(out_fasta, "fasta"):
        #print(rec.id)
        out.write(">{}\n{}\n".format(rec.id.split(".")[0], str(rec.seq).replace("-", "")))
        

