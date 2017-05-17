#!/bin/bash
for i in `seq 0 3`;
do
    command="swif add-jsub -workflow swif_example -script gen_${i}.xml"
    echo $command
    $command
done
