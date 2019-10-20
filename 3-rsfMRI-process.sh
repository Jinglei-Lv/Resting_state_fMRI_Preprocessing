
for ((i=1;i<=109;i++))
do
   for tt in time1 time2
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
