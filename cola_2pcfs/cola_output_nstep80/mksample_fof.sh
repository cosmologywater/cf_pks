
# 0. Settings

#nowfile=sub00001c
nowfile=fof00001c.nbar-4.7e-4

nbar=4.7e-4

ngal=505983

om=0.3071


# 0. radeczw file, particle sample

#awk < ${nowfile}.txt '{print $1,$2,$3}' > ${nowfile}.xyz

#LSS_XYZWToRaDecZW -inputfile ${nowfile}.xyz -om 0.307115 

#awk < ${nowfile}.xyz.om0.3071_w-1.0000 '{print $1+0,$2+0,$3+0,1}' > ${nowfile}.om0.3071_w-1.0000.radeczw

#rm ${nowfile}.xyz.om0.3071_w-1.0000



# 1. radeczw file, whole sample

awk < ${nowfile} '{print $2,$3,$4}' > ${nowfile}.xyz

LSS_XYZWToRaDecZW -inputfile ${nowfile}.xyz -om 0.307115  

awk < ${nowfile}.xyz.om0.3071_w-1.0000 '{print $1+0,$2+0,$3+0,1}' > ${nowfile}.om0.3071_w-1.0000.radeczw

rm ${nowfile}.xyz.om0.3071_w-1.0000


# 2. add RSD
LSS_SnapshotRSDmock -input ${nowfile}  -xyzmin 0 -xyzmax 1024 -xcol 2 -ycol 3 -zcol 4 -vxcol 5 -vycol 6 -vzcol 7 -redshift 0 -omegam ${om} -w -1 -shiftx T -shifty T -shiftz T -shiftr T


for suffix in '' .shiftr .shiftx .shifty .shiftz
do
       file1=${nowfile}${suffix}
       LSS_XYZWToRaDecZW -inputfile ${file1} -om $om -w -1
       awk < ${file1}.om${om}_w-1.0000 '{print $1+0,$2+0,$3+0,1}' > ${file1}.om${om}_w-1.0000.radeczw
       rm ${file1}.om${om}_w-1.0000
done

# 4. random file

#ranfile=${nowfile_degraded}.x30ran0
#py_ran ${ranfile} $((${ngal}*30)) 1024 box 1w
#ranfile=${nowfile}.x30ran0
#py_ran ${ranfile} $((${nline}*30)) 1024 box 1w
ranfile=${nowfile}.x8ran0
py_ran ${ranfile} $((${ngal}*8)) 1024 box 1w


LSS_XYZWToRaDecZW -inputfile ${ranfile} -om 0.307115
awk < ${ranfile}.om0.3071_w-1.0000 '{print $1+0,$2+0,$3+0,1}' > ${ranfile}.om0.3071_w-1.0000.radeczw
rm ${ranfile}.om0.3071_w-1.0000

