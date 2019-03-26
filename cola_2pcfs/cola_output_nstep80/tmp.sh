
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

#LSS_XYZWToRaDecZW -inputfile ${nowfile}.xyz -om 0.307115  -xcol 2 -ycol 3 -zcol 4
LSS_XYZWToRaDecZW -inputfile ${nowfile}.xyz -om 0.307115  

awk < ${nowfile}.xyz.om0.3071_w-1.0000 '{print $1+0,$2+0,$3+0,1}' > ${nowfile}.om0.3071_w-1.0000.radeczw

rm ${nowfile}.xyz.om0.3071_w-1.0000
