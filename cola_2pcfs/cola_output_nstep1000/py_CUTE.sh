
for datafile in fof00001c.nbar-4.7e-4.om0.3071_w-1.0000.radeczw fof00001c.nbar-4.7e-4.shiftr.om0.3071_w-1.0000.radeczw
#for datafile in sub00001c.txt.om0.3071_w-1.0000.radeczw sub00001c.txt.shiftr.om0.3071_w-1.0000.radeczw
do
	#ranfile=sub00001c.x30ran0.om0.3071_w-1.0000.radeczw
        ranfile=fof00001c.nbar-4.7e-4.x30ran0.om0.3071_w-1.0000.radeczw
	smax=150
	sbin=150
	mubin=120 # mu := cos theta, theat: angle between line-of-sight and pair

	suffix1=${sbin}s0to${smax}.${mubin}mu
	suffix2=${sbin}s0to${smax}.sigpi

	inifile1=${datafile}.${suffix1}.ini
	inifile2=${datafile}.${suffix2}.ini
	Tpcffile1=${datafile}.${suffix1}.2pcf
	Tpcffile2=${datafile}.${suffix2}.2pcf
	rrfile1=${ranfile}.${suffix1}.rr
	rrfile2=${ranfile}.${suffix2}.rr

	echo 'datafile, ranfile = ' $datafile $ranfile
	echo 'Weill generate:'
	echo '   inifile:  ' $inifile1, $inifile2
	echo '   2pcffile: ' ${Tpcffile1}, ${Tpcffile2}
	echo '   rrfile:   ' $rrfile1, $rrfile2
	echo ''
	echo 'Start running CUTE...'
	
	#py_CUTE    -cute_exe /home/xiaodongli/software/CUTE/CUTE/CUTE    -cute_ini_filename $inifile1    -corr_type 3D_rm  -input_format 2    -log_bin 0 -dim1_max $smax   -dim1_nbin $sbin -dim2_max 0.1   -dim2_nbin $mubin  -omega_M 0.3071  -omega_L 0.6929 -w -1    -data_filename $datafile   -random_filename $ranfile -output_filename ${Tpcffile1}   -RR_filename ${rrfile1}
	py_CUTE    -cute_exe /home/xiaodongli/software/CUTE/CUTE/CUTE    -cute_ini_filename $inifile2    -corr_type 3D_ps  -input_format 2    -log_bin 0 -dim1_max $smax   -dim1_nbin $sbin -dim2_max $smax   -dim2_nbin $sbin  -omega_M 0.3071  -omega_L 0.6929 -w -1    -data_filename $datafile   -random_filename $ranfile -output_filename ${Tpcffile2}   -RR_filename ${rrfile2}
done

