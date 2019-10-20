
for i in 103 105
do
   for tt in time1
   do
	echo ${tt}_$i
	if [ -d "./${tt}/$i" ]; then
           fmridir=$PWD/${tt}/$i/RS
	   fmrifname=rs

           ./Reg_retrend.sh $fmridir $fmrifname
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

           ./Reg_retrend.sh $fmridir $fmrifname
	fi
   done
done
