#!/bin/bash
cd "C:/Users/modin/Desktop/Ettore/UNIVERSITA/ECC_GAMS/ECC-Project2"


# This is to create a tider nameout 
name=()
for c in nperc_incr_{0.1,0.3,0.5,0.7,0.9}  ; do
    name+=($c)
done

# this is to launch the different flags
arg=()
for c in  --nperc_incr={0.1,0.3,0.5,0.7,0.9}; do
    arg+=($c)
done


## DON'T MODIFY
for ((i=0 ; i < ${#arg[@]} ; ++i)) ; do
    echo ${arg[i]} --nameout=${name[i]} 
    #C:/GAMS/42/gams run_witch.gms ${arg[i]} --nameout=${name[i]} 
done

# bash run_model_witch.sh