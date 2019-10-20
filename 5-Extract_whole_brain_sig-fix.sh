for i in 103 105
do
   for tt in time1
   do
	echo ${tt}_$i
        if [ -d "./${tt}/$i" ]; then
        fmriname=$PWD/${tt}/$i/RS/rs.feat/filtered_func_data2std_NN_retrend.nii.gz
        /home/tllab/jlv/exe/Extract_Whole_brain_signal $fmriname MNI152_2mm_mask.nii.gz 1 ./Whole_b_signals/${i}_${tt}
  
fi   
done
done

for i in 55 79
do
   for tt in time2
   do
	echo ${tt}_$i
        if [ -d "./${tt}/$i" ]; then
        fmriname=$PWD/${tt}/$i/RS/rs.feat/filtered_func_data2std_NN_retrend.nii.gz
        /home/tllab/jlv/exe/Extract_Whole_brain_signal $fmriname MNI152_2mm_mask.nii.gz 1 ./Whole_b_signals/${i}_${tt}
  
fi   
done
done
