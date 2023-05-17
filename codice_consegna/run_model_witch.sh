#!/bin/bash
cd "C:/Users/modin/Desktop/Ettore/UNIVERSITA/ECC_GAMS/witchmodel"



# This is to create a tider nameout 
name=()
for c in baseline_{ssp1,ssp3,ssp4,ssp5}  ; do
    name+=($c)
done

# this is to launch the different flags
arg=()
for c in  --baseline={ssp1,ssp3,ssp4,ssp5}; do
    arg+=($c)
done


## DON'T MODIFY
for ((i=0 ; i < ${#arg[@]} ; ++i)) ; do
    echo ${arg[i]} --nameout=${name[i]} 
    #C:/GAMS/42/gams run_witch.gms ${arg[i]} --nameout=BPU_CMB${name[i]} 
done

# bash run_model_witch.sh