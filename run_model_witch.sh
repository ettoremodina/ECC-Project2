#!/bin/bash
cd "C:/Users/asus/Documents/GitHub/witchmodel"


# This is to create a tider nameout 
name=()
for c in nperc_incr_{4,5,6,7}  ; do
    name+=($c)
done

# this is to launch the different flags
arg=()
for c in  --nperc_incr={4,5,6,7}; do
    arg+=($c)
done


## DON'T MODIFY
for ((i=0 ; i < ${#arg[@]} ; ++i)) ; do
    echo ${arg[i]} --nameout=${name[i]} 
    C:/GAMS/42/gams run_witch.gms ${arg[i]} --nameout=${name[i]} 
done

# bash run_model_witch.sh