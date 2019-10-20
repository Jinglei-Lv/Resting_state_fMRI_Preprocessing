
for i in 103 105
do
   for tt in time1
   do
	echo ${tt}_$i
	if [ -d "./${tt}/$i" ]; then
           fmridir=$PWD/${tt}/$i/RS
	   fmrifname=rs
           tmpfsf=$PWD/tmpl.fsf
           mstruct=$PWD/${tt}/$i/3D/T1_brain.nii.gz
           ./preProcessingfMRI.sh $fmridir $fmrifname $tmpfsf $mstruct
	fi
   done
done

for i in 55 79
do
   for tt in time2
   do
	echo ${tt}_$i
	if [ -d "./${tt}/$i" ]; then
           fmridir=$PWD/${tt}/$i/RS
	   fmrifname=rs
           tmpfsf=$PWD/tmpl.fsf
           mstruct=$PWD/${tt}/$i/3D/T1_brain.nii.gz
           ./preProcessingfMRI.sh $fmridir $fmrifname $tmpfsf $mstruct
	fi
   done
done
