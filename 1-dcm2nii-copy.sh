mkdir time1
mkdir time2

for ((i=1;i<=9;i++))
do
  echo $i
  if [ -d "../ABELD00$i" ]; then
	  for j in time1 time2
	  do
	    mkdir ./$j/$i
	    mkdir ./$j/$i/3D
	    mkdir ./$j/$i/RS

	  done
            dcm2nii -o ./time1/$i/3D ../ABELD00$i/3D/MR/*
	    dcm2nii -o ./time1/$i/RS ../ABELD00$i/RS/MR/*

            dcm2nii -o ./time2/$i/3D ../ABELD00${i}time2/3D/MR/*
	    dcm2nii -o ./time2/$i/RS ../ABELD00${i}time2/RS/MR/*
	   for j in time1 time2
	   do
	    cp ./$j/$i/3D/2*.nii.gz ./$j/$i/3D/T1.nii.gz         
  	    cp ./$j/$i/RS/*.nii.gz ./$j/$i/RS/rs.nii.gz 
           done
   fi
done

for ((i=10;i<=99;i++))
do
  echo $i
  if [ -d "../ABELD0$i" ]; then
	  for j in time1 time2
	  do
	    mkdir ./$j/$i
	    mkdir ./$j/$i/3D
	    mkdir ./$j/$i/RS

	  done
            dcm2nii -o ./time1/$i/3D ../ABELD0$i/3D/MR/*
	    dcm2nii -o ./time1/$i/RS ../ABELD0$i/RS/MR/*

            dcm2nii -o ./time2/$i/3D ../ABELD0${i}time2/3D/MR/*
	    dcm2nii -o ./time2/$i/RS ../ABELD0${i}time2/RS/MR/*
	   for j in time1 time2
	   do
	    cp ./$j/$i/3D/2*.nii.gz ./$j/$i/3D/T1.nii.gz         
  	    cp ./$j/$i/RS/*.nii.gz ./$j/$i/RS/rs.nii.gz 
           done
   fi
done

for ((i=100;i<=110;i++))
do
  echo $i
  if [ -d "../ABELD$i" ]; then
	  for j in time1 time2
	  do
	    mkdir ./$j/$i
	    mkdir ./$j/$i/3D
	    mkdir ./$j/$i/RS

	  done
            dcm2nii -o ./time1/$i/3D ../ABELD$i/3D/MR/*
	    dcm2nii -o ./time1/$i/RS ../ABELD$i/RS/MR/*

            dcm2nii -o ./time2/$i/3D ../ABELD${i}time2/3D/MR/*
	    dcm2nii -o ./time2/$i/RS ../ABELD${i}time2/RS/MR/*
	   for j in time1 time2
	   do
	    cp ./$j/$i/3D/2*.nii.gz ./$j/$i/3D/T1.nii.gz         
  	    cp ./$j/$i/RS/*.nii.gz ./$j/$i/RS/rs.nii.gz 
           done
   fi
done


