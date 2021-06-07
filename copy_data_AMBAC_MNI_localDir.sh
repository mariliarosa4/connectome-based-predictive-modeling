#!/bin/bash
study_path=/media/DATA/AMBAC/
prefix=AMBAC*
visit=visit1
target_dir=SELECTED_FILES/AMBAC/${visit}

mkdir -p $target_dir

#returns all folders with given prefix which contain a given visit.
dir_list=(`find ${study_path}${prefix}/${visit}/ -name 'PROC.PALA.NL_MNI'`)

n=0
for dir in "${dir_list[@]}"; do

#       #checks if pb05 files exist in visit/PROC.ML.PALA folder
        if [[ -n $(find ${dir} -name "stats.AMBAC*") ]]; then
                file=`find ${dir} -name "stats.AMBAC*"`
                echo "Copying file ${file} to ${target_dir}."
                #copy target files to local folder
                cp $file $target_dir
                n=$((n+1))
        else
                echo "no nii $dir"
        fi
done
echo $n
