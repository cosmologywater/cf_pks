#for nowfile in ahfhalos.0000.z0.000.AHF_halos ahfhalos.0006.z0.000.AHF_halos ahfhalos.0012.z0.000.AHF_halos ahfhalos.0018.z0.000.AHF_halos ahfhalos.0024.z0.000.AHF_halos ahfhalos.0030.z0.000.AHF_halos ahfhalos.0001.z0.000.AHF_halos ahfhalos.0007.z0.000.AHF_halos ahfhalos.0013.z0.000.AHF_halos ahfhalos.0019.z0.000.AHF_halos ahfhalos.0025.z0.000.AHF_halos ahfhalos.0031.z0.000.AHF_halos ahfhalos.0002.z0.000.AHF_halos ahfhalos.0008.z0.000.AHF_halos ahfhalos.0014.z0.000.AHF_halos ahfhalos.0020.z0.000.AHF_halos  ahfhalos.0026.z0.000.AHF_halos ahfhalos.0003.z0.000.AHF_halos ahfhalos.0009.z0.000.AHF_halos ahfhalos.0015.z0.000.AHF_halos ahfhalos.0021.z0.000.AHF_halos ahfhalos.0027.z0.000.AHF_halos ahfhalos.0004.z0.000.AHF_halos ahfhalos.0010.z0.000.AHF_halos ahfhalos.0016.z0.000.AHF_halos ahfhalos.0022.z0.000.AHF_halos ahfhalos.0028.z0.000.AHF_halos ahfhalos.0005.z0.000.AHF_halos ahfhalos.0011.z0.000.AHF_halos ahfhalos.0017.z0.000.AHF_halos ahfhalos.0023.z0.000.AHF_halos ahfhalos.0029.z0.000.AHF_halos
for nowfile in ahfhalos.0000.z0.000.AHF_halos
do 
	awk < ${nowfile} '{print $4,$6,$7,$8,$9,$10,$11}' > ${nowfile}.halo
done
	
