#!/bin/bash

for nowcoladir in cola_output cola_output_512grid  cola_output_nstep20
do
    echo '* coladir =  '$nowcoladir
    awk -v var=$nowcoladir < Makefile.save '{if($1 == "coladir") {print "coladir = " var} else {print $0 }}' > Makefile
    cp Makefile Makefile.$nowcoladir
    make 
done

