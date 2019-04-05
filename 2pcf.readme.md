# 2pcf.readme
这些“marked CF”文件名都有“rho-1”。

“-1”的意思是权重为$\rho^{-1}$。也有"rho-0.8"和"rho-0.5"的文件。

*文件存储于十三的电脑上：/home/xiaodongli/data/CITAData/subsamples/...*

*多数文件能在三天内上传（目前的文件不够完整，有错误存在）。大家可以到十三的电脑上复制下来*

> 单个文件中共有150\*120 $(s,\mu)$.

1. **.2pcf文件的第一行:**

	三个归一系数，分别对应DD, DR, RR
    
2. **给出的DD, DR, RR数据都需要除以相应归一化系数来规范化。**

3. **数据中不同的列分别代表**

	> $\mu$ s $\xi$ DD DR RD RR
    
4. **计算$\xi$**

    $\xi=\frac{DD-2DR+RR}{RR}$*（计算式中各数据是文件中列出数据除以相应规范化系数后的结果）*

5. **计算$\xi(s)$?**

    对给定的s, 对不同$\xi$的所有DD, DR, RR求和，得出新的DD等数据，便可据此按照公式计算$\xi$
   
	得到的图像应该类似于(见其中'Correlation functions are useful') http://hosting.astro.cornell.edu/~amartin/research.html

	可通过乘$s^2$对y轴作规范化，得到的图像会大概如此——（figure 16） https://arxiv.org/abs/1203.6594
    
6. **计算$\xi_{\Delta s}(\mu)$**

	$\xi_{\Delta s}(\mu)$的定义为$$\int_{s=s_1}^{s=s_2}\xi(s,\mu)\mathrm{d}s$$
    
	首先把所有的$\xi(s,\mu)$计算出来
    
	对某给定的$\mu$，把在$s_1\leq s\leq s_2$内的所有$\xi(s,\mu)$加起来。
    
	(fig 16) http://cn.arxiv.org/pdf/1609.05476 有图片供参考，得到的图像应与之类似
    
	x-axis: $1-\mu$
    
7. **还可以画$\xi(s,\mu)$的等高线图（contour map）哦**

	Figure 5 of http://cn.arxiv.org/pdf/1609.05476
    
    
**请留心：画出来的图要可读性高，图表标题能告知此图关乎何物。此外，两坐标轴标题、清楚的图例、合适的颜色也是不可或缺的**
