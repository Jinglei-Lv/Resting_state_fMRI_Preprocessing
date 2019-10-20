
for ((i=1;i<=109;i++))
do
   for tt in time1 time2
   do
	echo ${tt}_$i
	if [ -d "./${tt}/$i" ]; then
           fmridir=$PWD/${tt}/$i/RS
	   fmrifname=rs

           ./Reg_retrend.sh $fmridir $fmrifname
	fi
   done
done
