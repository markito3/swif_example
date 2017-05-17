#!/bin/bash
run=$1
file=$2
shift
shift
echo 1 = $1
echo -=-start job-=-
date
echo run $run file $file
#
cp -pv /home/marki/swif_example/run_files/* .
source /group/halld/Software/build_scripts/gluex_env_jlab.sh
#
# set number of events
#
number_of_events=1000
echo number_of_events = $number_of_events
#
# set flags based on run number
#
echo -=-run bggen-=-
seed=$run$file
echo seed = $seed
sed -e "s/<random_number_seed>/$seed/" < run.ffr.template > temp0
sed -e "s/<run_number>/$run/" < temp0 > temp1
sed -e "s/<number_of_events>/$number_of_events/" < temp1 > run.ffr
rm -f fort.15
ln -s run.ffr fort.15
bggen
mv -v bggen.hddm bggen_${run}_${file}.hddm
echo -=-ls -lt after bggen-=-
ls -lt
echo -=-exit-=-
exit
