for tt in time1 time2
do

	   for ((i=1;i<=109;i++))
	do
           echo ${tt}_$i
           if [ -d "./${tt}/$i" ]; then
		cd ./${tt}/$i/3D
		bet T1.nii.gz T1_brain.nii.gz
                #rm brain.nii.gz              
		cd ../../../  
                echo 'done!'        
		fi

	        
	done
done


