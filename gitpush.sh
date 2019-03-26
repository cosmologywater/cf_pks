git pull
git add *.sh
git add *.py
git add README.md

## src
git add src/*.py
git add src/*.ipynb
git add src/*.sh

## CITA Data related
git add CITAData/Redshifts.txt
git add CITAData/subsamples/*.2pcf

## cola related
git add cola_2pcfs/*/*.2pcf
git add cola_2pcfs/*/param.lua
git add cola_2pcfs/*/*.sh
git add cola_2pcfs/*/*.py
git add cola_2pcfs/*.ipynb

## BigMD related
git add BigMD_2pcfs/*.2pcf

git commit -m 'upload many things'
git push
