
for nowfile in cola_cita_015 cola_cita_014 cola_cita_013 cola_cita_012 cola_cita_011
do
#nowfile=gadget_001.rat0.0027_ranseed0

# nbar of original file: 0.005655978515625
#nbar=4.7e-4

#ngal=2895861

om=0.2951

# add RSD
#do
#        LSS_SnapshotRSDmock -input ${nowfile} -xyzmin 0 -xyzmax 800 -xcol 1 -ycol 2 -zcol 3 -vxcol 4 -vycol 5 -vzcol 6 -redshift 0 -omegam ${om} -w -1 -shiftx T -shifty T -shiftz T -shiftr T
#done
# 1. radeczw file, whole sample

        for suffix in '' .shiftr .shiftx .shifty .shiftz

        do  
                file1=${nowfile}${suffix}
                LSS_XYZWToRaDecZW -inputfile ${file1} -om $om -w -1
                awk < ${file1}.om${om}_w-1.0000 '{print $1+0,$2+0,$3+0,1}' > ${file1}.om${om}_w-1.0000.radeczw
                rm ${file1}.om${om}_w-1.0000
        done
done

# 2. degraded file

#nowfile_degraded=${nowfile}.nbar-${nbar}
#LSS_rmass_stat -input ${nowfile}.txt -rmin 0 -rmax 50000 -massmin 2 -massmax 1000000 -numrbin 1 -nummassbin 1000 -xcol 2 -ycol 3 -zcol 4 -masscol 1 -dodegrade T -numdegrade ${ngal} -logmass T -degradedfile ${nowfile}.nbar-${nbar}
#awk < ${nowfile_degraded} '{print $2,$3,$4}' > ${nowfile_degraded}.xyz
#LSS_XYZWToRaDecZW -inputfile ${nowfile_degraded}.xyz -om ${om}15
#awk < ${nowfile_degraded}.xyz.om${om}_w-1.0000 '{print $1+0,$2+0,$3+0,1}' > ${nowfile_degraded}.om${om}_w-1.0000.radeczw
#rm ${nowfile_degraded}.xyz


# 3. random file

#ranfile=${nowfile}.x10ran0
#py_ran ${ranfile} $((${ngal}*10)) 800 box 1w
#ranfile=${nowfile}.x30ran0
#py_ran ${ranfile} $((${nline}*30)) 1024 box 1w

#LSS_XYZWToRaDecZW -inputfile ${ranfile} -om ${om}15

#awk < ${ranfile}.om${om}_w-1.0000 '{print $1+0,$2+0,$3+0,1}' > ${ranfile}.om${om}_w-1.0000.radeczw

#rm ${ranfile}.om${om}_w-1.0000
#
