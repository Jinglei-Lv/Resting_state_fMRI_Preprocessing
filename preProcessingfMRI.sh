#!/bin/sh

#Jinglei Lv:2016-6-29

if [ $# != 4 ]; then
echo "usage: 1.fmriDir(not ending wih) 2.fMRIfname(withouth .nii.gz) 3.templateFile 4.main_structural_file"
exit
fi;

fMRIDir=${1}   # not ending with "/" and full path
fMRIfname=${2} # withough .nii.gz
fnameTMPL=${3}  # full path 
mstructuralfile=${4}  #full path

echo ${fMRIDir}
echo ${fMRIfname}
echo ${mstructuralfile}

#####generate fsf file from template
#fmri file name
strtmp=$(echo s:@FMRIFILE:${fMRIDir}/${fMRIfname}:)
sed ${strtmp} <${fnameTMPL} > ${fMRIDir}/tmp.fsf

#MAIN STRUCTURAL
strtmp=$(echo s:@mainstructural:${mstructuralfile}:)
sed ${strtmp} <${fMRIDir}/tmp.fsf > ${fMRIDir}/tmp1.fsf

#tsize
tsize=$(fslnvols ${fMRIDir}/${fMRIfname})
echo ${tsize}
sed s/@TSIZE/${tsize}/ <${fMRIDir}/tmp1.fsf > ${fMRIDir}/tmp2.fsf

#TR
tr=$(fslval ${fMRIDir}/${fMRIfname} pixdim4)
echo ${tr}
sed s/@TR/$(echo $tr)/ <${fMRIDir}/tmp2.fsf > ${fMRIDir}/tmp3.fsf

#FWHM
fwhm=$(fslval ${fMRIDir}/${fMRIfname} pixdim3)
fwhm=$(echo "scale=2;$fwhm*2"|bc)
echo ${fwhm}
sed s/@FWHM/$(echo ${fwhm})/ <${fMRIDir}/tmp3.fsf > ${fMRIDir}/tmp4.fsf

#WARP
warp=$(fslval ${fMRIDir}/${fMRIfname} pixdim3)
warp=$(echo "scale=2;$warp*4"|bc)
echo ${warp}
sed s/@warp/$(echo ${warp})/ <${fMRIDir}/tmp4.fsf > ${fMRIDir}/design.fsf


#####perform feat
feat ${fMRIDir}/design.fsf



