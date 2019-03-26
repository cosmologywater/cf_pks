#for datafile in gadget_015.rat0.0027_ranseed0.shiftr.om0.2951_w-1.0000.radeczw gadget_014.rat0.0027_ranseed0.shiftr.om0.2951_w-1.0000.radeczw gadget_013.rat0.0027_ranseed0.shiftr.om0.2951_w-1.0000.radeczw gadget_012.rat0.0027_ranseed0.shiftr.om0.2951_w-1.0000.radeczw gadget_011.rat0.0027_ranseed0.shiftr.om0.2951_w-1.0000.radeczw gadget_010.rat0.0027_ranseed0.shiftr.om0.2951_w-1.0000.radeczw gadget_009.rat0.0027_ranseed0.shiftr.om0.2951_w-1.0000.radeczw gadget_008.rat0.0027_ranseed0.shiftr.om0.2951_w-1.0000.radeczw gadget_007.rat0.0027_ranseed0.shiftr.om0.2951_w-1.0000.radeczw gadget_006.rat0.0027_ranseed0.shiftr.om0.2951_w-1.0000.radeczw gadget_005.rat0.0027_ranseed0.shiftr.om0.2951_w-1.0000.radeczw gadget_004.rat0.0027_ranseed0.shiftr.om0.2951_w-1.0000.radeczw gadget_003.rat0.0027_ranseed0.shiftr.om0.2951_w-1.0000.radeczw gadget_002.rat0.0027_ranseed0.shiftr.om0.2951_w-1.0000.radeczw gadget_001.rat0.0027_ranseed0.shiftr.om0.2951_w-1.0000.radeczw gadget_000.rat0.0027_ranseed0.shiftr.om0.2951_w-1.0000.radeczw  
#for datafile in cola_cita_015.shiftr.om0.2951_w-1.0000.radeczw cola_cita_014.shiftr.om0.2951_w-1.0000.radeczw cola_cita_013.shiftr.om0.2951_w-1.0000.radeczw cola_cita_012.shiftr.om0.2951_w-1.0000.radeczw cola_cita_011.shiftr.om0.2951_w-1.0000.radeczw
for datafile in cola_cita_012.shiftr.om0.2951_w-1.0000.radeczw cola_cita_011.shiftr.om0.2951_w-1.0000.radeczw
do
	ranfile=gadget_016.rat0.0027_ranseed0.x10ran0.om0.2951_w-1.0000.radeczw

	smax=150
	sbin=150
	mubin=120 # mu := cos theta, theat: angle between line-of-sight and pair

	suffix=${sbin}s0to${smax}.${mubin}mu

	inifile=${datafile}.${suffix}.ini
	Tpcffile=${datafile}.${suffix}.2pcf
	#rrfile=${ranfile}.${suffix}.rr
	rrfile=gadget_016.rat0.0027_ranseed0.x10ran0.om0.2951_w-1.0000.radeczw.150s0to150.120mu.rr

	echo 'datafile, ranfile = ' $datafile $ranfile
	echo 'Weill generate:'
	echo '   inifile:  ' $inifile
	echo '   2pcffile: ' ${Tpcffile}
	echo '   rrfile:   ' $rrfile
	echo ''
	echo 'Start running CUTE...'
	
	py_CUTE    -cute_exe /home/xiaodongli/software/CUTE/CUTE/CUTE    -cute_ini_filename $inifile    -corr_type 3D_rm  -input_format 2    -log_bin 0 -dim1_max $smax   -dim1_nbin $sbin -dim2_max 0.1   -dim2_nbin $mubin  -omega_M 0.2951  -omega_L 0.7049 -w -1    -data_filename $datafile   -random_filename $ranfile -output_filename ${Tpcffile}   -RR_filename ${rrfile}
done
