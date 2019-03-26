

# 第一列去掉

用 awk 去掉。。。
#awk < fof00001c.txt '{print $2,$3,$4}' > fof00001c.xyz
xyz

#LSS_XYZWToRaDecZW -inputfile fof00001c.xyz -om 0.307115 -outputfile 

radecz

#awk < fof00001c.xyz.om0.3071_w-1.0000 '{print $1+0,$2+0,$3+0,1}' > fof00001c.om0.3071_w-1.0000.radeczw
radeczw

# zuo mass cut 
学着用 awk 来 cut: M > 1e13
#m_particle_to_solar/10**13 = 0.00391368728329
#1/0.00391368728329 = 255.51351644001576
#awk < fof00001c.txt  '$1>255.51351644001576' > fof00001c.e13
#awk < fof00001c.e13 '{print $2,$3,$4}' > fof00001c.e13.xyz
#LSS_XYZWToRaDecZW -inputfile fof00001c.e13.xyz -om 0.307115 
#awk < fof00001c.e13.xyz.om0.3071_w-1.0000 '{print $1+0,$2+0,$3+0,1}' > fof00001c.e13.om0.3071_w-1.0000.radeczw




radeczw_cutted

# 生成一个 random file (相同体积，随机数，个数在 data file 的 x15-x30 
#py_ran x30ran0.om0.307115_w-1.0000 55804230 1024 box 1w
#py_ran x30ran0.om0.307115e13_w-1.0000 7114770 1024 box 1w

#py_ran




degreade
#awk < fof00001c.nbar-4.70e-4 '{print $2,$3,$4}' > fof00001c.nbar-4.70e-4.xyz
#LSS_XYZWToRaDecZW -inputfile fof00001c.nbar-4.70e-4.xyz -om 0.307115
#awk < fof00001c.nbar-4.70e-4.xyz.om0.3071_w-1.0000 '{print $1+0,$2+0,$3+0,1}' > fof00001c.nbar-4.70e-4.xyz.om0.3071_w-1.0000.radeczw
#LSS_XYZWToRaDecZW -inputfile fof00001c.nbar-4.70e-4 -om 0.307115
#awk < fof00001c.nbar-4.70e-4.om0.3071_w-1.0000 '{print $1+0,$2+0,$3+0,1}' > fof00001c.nbar-4.70e-4.om0.3071_w-1.0000.radeczw


#py_ran

#py_ran x30ran0.nbar-4.70e-4 15200000 1024 box 1w
#LSS_XYZWToRaDecZW -inputfile x30ran0.nbar-4.70e-4 -om 0.307115
#awk < x30ran0.nbar-4.70e-4.om0.3071_w-1.0000 '{print $1+0,$2+0,$3+0,1}' > x30ran0.nbar-4.70e-4.om0.3071_w-1.0000.radeczw

# 

py_CUTE    -cute_exe /home/xiaodongli/software/CUTE/CUTE/CUTE    -cute_ini_filename ./tmp_cute_ini    -corr_type 3D_rm  -input_format 2    -log_bin 0 -dim1_max 150   -dim1_nbin 150  -dim2_max 0.1  -dim2_nbin 120     -omega_M 0.307115  -omega_L 0.692885  -w -1    -data_filename fof00001c.xyzw -random_filename fof00001c.xyzw -output_filename fof00001c.150r0to150.120mu.2pcf

# 最后，改成 Makefile 

