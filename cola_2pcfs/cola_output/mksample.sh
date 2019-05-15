
# 0. Settings

nowfile=matchmaker_fof

nbar=4.7e-4

ngal=505075

om=0.3071
#xiaodongli@xiaodongli:~/data/BigMDPL_mge1e13$ wc -l BigMDPL_mge1e13.csv.snap79.shiftx
#7349809 BigMDPL_mge1e13.csv.snap79.shiftx
#xiaodongli@xiaodongli:~/data/BigMDPL_mge1e13$ python
#Python 2.7.15 |Anaconda, Inc.| (default, May  1 2018, 23:32:55)
#[GCC 7.2.0] on linux2
#Type "help", "copyright", "credits" or "license" for more information.
#>>> 7349809 /(2500.0**3)
#0.000470387776
#>>> 0.000470387776 * (1024**3.)
#505075.0285895434

#nbar=0.000470387776

#STR=$(wc -l ${nowfile}.txt)
#STR=$(${STR})
#nline=${STR[1]}
#echo '#-line :' $nline

#exit


# 1. radeczw file, whole sample

#awk < ${nowfile}.txt '{print $2,$3,$4}' > ${nowfile}.xyz

#LSS_XYZWToRaDecZW -inputfile ${nowfile}.xyz -om 0.307115 

#awk < ${nowfile}.xyz.om0.3071_w-1.0000 '{print $1+0,$2+0,$3+0,1}' > ${nowfile}.om0.3071_w-1.0000.radeczw

#rm ${nowfile}.xyz.om0.3071_w-1.0000

# 2. degraded file

nowfile_degraded=${nowfile}.nbar-${nbar}

LSS_rmass_stat -input ${nowfile}.txt -rmin 0 -rmax 50000 -massmin 2 -massmax 1000000 -numrbin 1 -nummassbin 1000 -xcol 4 -ycol 5 -zcol 6 -masscol 3 -dodegrade T -numdegrade ${ngal} -logmass T -degradedfile ${nowfile}.nbar-${nbar}

#awk < ${nowfile_degraded} '{print $2,$3,$4}' > ${nowfile_degraded}.xyz

#LSS_XYZWToRaDecZW -inputfile ${nowfile_degraded}.xyz -om 0.307115

#awk < ${nowfile_degraded}.xyz.om0.3071_w-1.0000 '{print $1+0,$2+0,$3+0,1}' > ${nowfile_degraded}.om0.3071_w-1.0000.radeczw

#rm ${nowfile_degraded}.xyz

# 3. add RSD
LSS_SnapshotRSDmock -input ${nowfile_degraded}  -xyzmin 0 -xyzmax 1024 -xcol 2 -ycol 3 -zcol 4 -vxcol 5 -vycol 6 -vzcol 7 -redshift 0 -omegam ${om} -w -1 -shiftx T -shifty T -shiftz T -shiftr T

# 1. radeczw file, whole sample

for suffix in '' .shiftr .shiftx .shifty .shiftz
do
       file1=${nowfile_degraded}${suffix}
       LSS_XYZWToRaDecZW -inputfile ${file1} -om $om -w -1
       awk < ${file1}.om${om}_w-1.0000 '{print $1+0,$2+0,$3+0,1}' > ${file1}.om${om}_w-1.0000.radeczw
       rm ${file1}.om${om}_w-1.0000
done

# 4. random file

#ranfile=${nowfile_degraded}.x30ran0
#py_ran ${ranfile} $((${ngal}*30)) 1024 box 1w
#ranfile=${nowfile}.x30ran0
#py_ran ${ranfile} $((${nline}*30)) 1024 box 1w

#LSS_XYZWToRaDecZW -inputfile ${ranfile} -om 0.307115

#awk < ${ranfile}.om0.3071_w-1.0000 '{print $1+0,$2+0,$3+0,1}' > ${ranfile}.om0.3071_w-1.0000.radeczw

#rm ${ranfile}.om0.3071_w-1.0000

