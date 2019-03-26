
for datafile in fof00001c.nbar-4.7e-4.om0.3071_w-1.0000.radeczw
#for datafile in fof00001c.nbar-4.7e-4.om0.3071_w-1.0000.radeczw fof00001c.nbar-4.7e-4.shiftr.om0.3071_w-1.0000.radeczw 
do
	ranfile=fof00001c.nbar-4.7e-4.x30ran0.om0.3071_w-1.0000.radeczw

	smax=150
	sbin=150
	mubin=120 # mu := cos theta, theat: angle between line-of-sight and pair

	suffix=${sbin}s0to${smax}.${mubin}mu

	inifile=${datafile}.${suffix}.ini
	Tpcffile=${datafile}.${suffix}.2pcf
	rrfile=${ranfile}.${suffix}.rr

	echo 'datafile, ranfile = ' $datafile $ranfile
	echo 'Weill generate:'
	echo '   inifile:  ' $inifile
	echo '   2pcffile: ' ${Tpcffile}
	echo '   rrfile:   ' $rrfile
	echo ''
	echo 'Start running CUTE...'
	
	py_CUTE    -cute_exe /home/xiaodongli/software/CUTE/CUTE/CUTE    -cute_ini_filename $inifile    -corr_type 3D_rm  -input_format 2    -log_bin 0 -dim1_max $smax   -dim1_nbin $sbin -dim2_max 0.1   -dim2_nbin $mubin  -omega_M 0.3071  -omega_L 0.6929 -w -1    -data_filename $datafile   -random_filename $ranfile   -output_filename ${Tpcffile}   -RR_filename ${rrfile}
done

