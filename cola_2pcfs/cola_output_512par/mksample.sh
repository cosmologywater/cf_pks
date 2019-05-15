
# 0. Settings

#nowfile=sub00001c

om=0.3071


for (( i=1; i<=1000; i++ ))
do
	nowfile=$(printf "%05d" $i)
	nowfile=sub${nowfile}a.txt
	LSS_XYZWToRaDecZW -inputfile ${nowfile} -om 0.307115 
	awk < ${nowfile}.om0.3071_w-1.0000 '{print $1+0,$2+0,$3+0,1}' > ${nowfile}.om0.3071_w-1.0000.radeczw
	rm ${nowfile}.om0.3071_w-1.0000

	LSS_SnapshotRSDmock -input ${nowfile}  -xyzmin 0 -xyzmax 1024 -xcol 2 -ycol 3 -zcol 4 -vxcol 5 -vycol 6 -vzcol 7 -redshift 0 -omegam ${om} -w -1 -shiftx T -shifty T -shiftz T -shiftr T

	for suffix in '' .shiftr #.shiftx .shifty .shiftz
	do
       		file1=${nowfile}${suffix}
       		LSS_XYZWToRaDecZW -inputfile ${file1} -om $om -w -1
       		awk < ${file1}.om${om}_w-1.0000 '{print $1+0,$2+0,$3+0,1}' > ${file1}.om${om}_w-1.0000.radeczw
		rm ${file1}.om${om}_w-1.0000
	done

done


exit

for nowfile in sub00001a.txt  sub00003a.txt  sub00005a.txt  sub00007a.txt  sub00009a.txt sub00002a.txt  sub00004a.txt  sub00006a.txt  sub00008a.txt
do


LSS_XYZWToRaDecZW -inputfile ${nowfile} -om 0.307115 
awk < ${nowfile}.om0.3071_w-1.0000 '{print $1+0,$2+0,$3+0,1}' > ${nowfile}.om0.3071_w-1.0000.radeczw
rm ${nowfile}.om0.3071_w-1.0000

LSS_SnapshotRSDmock -input ${nowfile}  -xyzmin 0 -xyzmax 1024 -xcol 2 -ycol 3 -zcol 4 -vxcol 5 -vycol 6 -vzcol 7 -redshift 0 -omegam ${om} -w -1 -shiftx T -shifty T -shiftz T -shiftr T

for suffix in '' .shiftr .shiftx .shifty .shiftz
do
       file1=${nowfile}${suffix}
       LSS_XYZWToRaDecZW -inputfile ${file1} -om $om -w -1
       awk < ${file1}.om${om}_w-1.0000 '{print $1+0,$2+0,$3+0,1}' > ${file1}.om${om}_w-1.0000.radeczw
       rm ${file1}.om${om}_w-1.0000
done

done

