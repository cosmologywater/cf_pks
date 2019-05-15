for file in `ls snp00001c*`
do 
	mv $file `echo $file|sed 's/c//g'`
done
