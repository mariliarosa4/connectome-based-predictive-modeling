#!/bin/bash
study_path=SELECTED_FILES/AMBAC
visit=visit1
target_dir=SELECTED_FILES/AMBAC_nii_stats/${visit}/

mkdir -p $target_dir

#returns all folders with given prefix which contain a given visit.
dir_list=(`find ${study_path}/${visit}/`)

n=0
for dir in "${dir_list[@]}"; do

	file=`find ${dir} -printf "%f\n"`
	echo ${file}
	3dAFNItoNIFTI ${dir} -prefix ${target_dir}${file}.nii

done

