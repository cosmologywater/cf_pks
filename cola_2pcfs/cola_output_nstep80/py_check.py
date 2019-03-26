import numpy as np
data = np.loadtxt('fof00001c.nbar-4.7e-4.om0.3071_w-1.0000.radeczw')
for iline in range(len(data)):
    if data[iline][2] > 0 and data[iline][2] < 0.8:
        continue
    else:
        print iline, data[iline]
    
