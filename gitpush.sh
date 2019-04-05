git pull
git add *.sh
git add *.py
git add README.md

##
#git add *.readme
#git add */Redshift*
#git add */*.sh
#git add */*.py


## src
git add src/*.py
git add src/*.ipynb
git add src/*.sh

## CITA Data related
git add CITAData/Redshifts.txt
git add CITAData/subsamples/*.2pcf

## cola related
for nowfile in Makefile    Note    configure    parameter_file    outputs    Makefile.sample 
do
	git add cola_2pcfs/$nowfile
done
git add cola_2pcfs/*/*.2pcf
git add cola_2pcfs/*/Makefile
git add cola_2pcfs/*/param.lua
git add cola_2pcfs/*/*.sh
git add cola_2pcfs/*/*.py
git add cola_2pcfs/*/*.dat
git add cola_2pcfs/*.ipynb

## BigMD related
git add BigMD_2pcfs/*.2pcf
git add BigMD_2pcfs/Redshift*

git commit -m  'upload many things '
git push
