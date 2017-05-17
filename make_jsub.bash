#!/bin/bash
run[0]=1
run[1]=2
run[2]=3
run[3]=4
file[0]=9
file[1]=8
file[2]=7
file[3]=6
for i in `seq 0 3`;
do
    echo making jsub file for i = $i, run = ${run[$i]}, file = ${file[$i]}
    sed -e "s/{run}/${run[$i]}/" -e "s/{file}/$file/" < gen.xml.template > gen_${i}.xml
done
