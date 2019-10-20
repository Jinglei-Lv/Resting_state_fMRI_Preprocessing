for ((i=1;i<=110;i++))
do
  if [ -d "./time1/$i" ]; then
     echo $i >> ids.txt 
  fi
done
