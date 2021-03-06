# RAxML-NF

This repository contains: 

1) A dataset containing motor protein Prestin from 35 different species, as published by Liu et al.15. Motor protein Prestin is expressed in mammalian outer hair cells (OHCs) and is thought to confer high frequency sensitivity and selectivity in the mammalian auditory system.

2) Results of RAxML estimated phylogenetic trees run on Mac, Linux and with Nextflow portable runtime. 

3) The instructions how to replicate these results.


## Folder structure

* Folder `data/`: input dataset. 

* Folder `RAxML_NF_RESULTS/`: experiment results. 


## How to replicate results 

Clone this repository from GitHub using the following command: 

    git clone https://github.com/cbcrg/raxml-nf.git

then move in the directory `raxml-nf` create by the clone command.


### Native RAxML run on Linux & Mac

Download the RAxML toolset for Linux from 
[this link](https://github.com/stamatak/standard-RAxML/archive/v8.0.0.zip), 

Compile typing:

    make -f Makefile.gcc

and install it properly, making sure that the `raxmlHPC` binary is in a directory in your `PATH`.

You can then run RAxML using the following command: 

    raxmlHPC -p 9 -T 2 -f d -j -m PROTGAMMALG -s data/prestin_SLC26A5.35eutheria.original.msa -n PRESTIN 
    
    
### Nextflow RAxML run on Linux & Mac

Install Nextflow with the following command: 

    curl -fsSL get.nextflow.io | bash

Install Docker following the instruction at [this page](https://docs.docker.com/engine/installation/). 

Move in the `raxml-nf` subfolder. 

Run this command 

    nextflow run raxml.nf -with-docker
 
The command above executes RAxML by using by default the parameters specified in the native
command line provided in the previous examples. 




    
