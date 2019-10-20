#!/bin/sh

#Jinglei Lv:2016-6-29

if [ $# != 2 ]; then
echo "usage: 1.fmriDir(not ending wih) 2.fMRIfname(withouth .nii.gz)"
exit
fi;

fMRIDir=${1}   # not ending with "/" and full path
fMRIfname=${2} # withough .nii.gz


echo ${fMRIDir}
echo ${fMRIfname}

#tsize
tsize=$(fslnvols ${fMRIDir}/${fMRIfname})
echo ${tsize}
#TR
tr=$(fslval ${fMRIDir}/${fMRIfname} pixdim4)
echo ${tr}


#####Reg fMRI to MNI; 
applywarp --ref=${fMRIDir}/${fMRIfname}.feat/reg/standard.nii.gz --in=${fMRIDir}/${fMRIfname}.feat/filtered_func_data.nii.gz --out=${fMRIDir}/${fMRIfname}.feat/filtered_func_data2std_NN.nii.gz --warp=${fMRIDir}/${fMRIfname}.feat/reg/highres2standard_warp.nii.gz --premat=${fMRIDir}/${fMRIfname}.feat/reg/example_func2highres.mat

applywarp --ref=${fMRIDir}/${fMRIfname}.feat/reg/standard.nii.gz --in=${fMRIDir}/${fMRIfname}.feat/mean_func.nii.gz --out=${fMRIDir}/${fMRIfname}.feat/mean_func2std_NN.nii.gz --warp=${fMRIDir}/${fMRIfname}.feat/reg/highres2standard_warp.nii.gz --premat=${fMRIDir}/${fMRIfname}.feat/reg/example_func2highres.mat

fslmaths ${fMRIDir}/${fMRIfname}.feat/mean_func2std_NN.nii.gz -bin ${fMRIDir}/${fMRIfname}.feat/mask2std_NN.nii.gz

#####retrend
/home/tllab/jlv/exe/filteringfMRI ${fMRIDir}/${fMRIfname}.feat/filtered_func_data2std_NN.nii.gz ${fMRIDir}/${fMRIfname}.feat/filtered_func_data2std_NN_retrend.nii.gz -t ${tr} -n ${tsize} -m ${fMRIDir}/${fMRIfname}.feat/mask2std_NN.nii.gz -l 0.21 -h 0.0019 -r

##### filtering

/home/tllab/jlv/exe/filteringfMRI ${fMRIDir}/${fMRIfname}.feat/filtered_func_data2std_NN.nii.gz ${fMRIDir}/${fMRIfname}.feat/filtered_func_data2std_NN_bpfilter.nii.gz -t ${tr} -n ${tsize} -m ${fMRIDir}/${fMRIfname}.feat/mask2std_NN.nii.gz -l 0.1 -h 0.01 

##### retrend+filtering

/home/tllab/jlv/exe/filteringfMRI ${fMRIDir}/${fMRIfname}.feat/filtered_func_data2std_NN.nii.gz ${fMRIDir}/${fMRIfname}.feat/filtered_func_data2std_NN_retrend_bpfilter.nii.gz -t ${tr} -n ${tsize} -m ${fMRIDir}/${fMRIfname}.feat/mask2std_NN.nii.gz -l 0.1 -h 0.01 -r

