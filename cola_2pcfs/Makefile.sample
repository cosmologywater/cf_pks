# 对一系列 randseed 跑 cola
# 核心依赖文件： (改变后一切重跑)
#	$(coladir)/param.lua (基于它，生成不同 randseed 的 param_rand*.lua)
#	$(coladir)/BigMDPL_matterpower.dat (一旦这个改变，一切改变)



# Number of MPI processes 
np=32

# cola, pinocchio exes  
cola=/home/xiaodongli/software/cola_halo/cola_halo
pino=/home/xiaodongli/software/Pinocchio-4.1.2/src/pinocchio.x

# random seeds you want to have 
rands = 1


# Keep the generated .lua fils (do not delete them)
.PRECIOUS: param_rand%.lua

# log files (日志文件，每个 randseed 生成一个 cola_randXXX.log 的日志文件)
cola_logs =  $(foreach rand, $(rands), cola_rand$(rand).log)

# 日志文件的生成规则：依赖于相应的 .lua 文件，matterpower文件。跑 cola，生成日志文件与各种数据文件
#	具体生成哪些数据文件，取决于 $(coladir)/param.lua 的设置
#%.log: %.lua 
cola_rand%.log: param_rand%.lua BigMDPL_matterpower.dat
	@echo  "\n###################################\n  Running for randseed = $*...\n###################################\n"
	###cd $(coladir) && export OMP_NUM_THREADS=1 && mpirun -np $(np) $(cola) param_rand$*.lua > cola_rand$*.log  && cat cola_rand$*.log && cd ..
	export OMP_NUM_THREADS=1 && mpirun -np $(np) $(cola) param_rand$*.lua | tee -a tmp.log   && cat tmp.log > cola_rand$*.log && rm tmp.log  
	date >> cola_rand$*.log
	@echo "Finish running for randseed = $*.\n----------------------------------\n"



# .lua 文件生成规则：依赖于  $(coladir)/param.lua，把依赖文件复制一份， randseed 改一下
param_rand%.lua: param.lua
	paramfile=param_rand$*.lua &&  cp param.lua tmpfile && echo "random_seed= $*" > $$paramfile && sed '1d' tmpfile >> $$paramfile

default: $(cola_logs)


# 删除所有日志文件：之后再 Make 会因找不到日志文件重跑
clean: 
	rm -f $(cola_logs)

# 删除所有日志文件与数据文件：慎用！
cleanall:
	rm -f fof* snp* grid* sub* *.log param_rand*.lua
