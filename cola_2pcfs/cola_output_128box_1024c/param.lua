random_seed= 200
-- cola code parameter file
nc  =  1024
boxsize = 128.0

nrealization= 1   -- multiple realisations for random_seed, random_seed+1, ...

-- ntimestep= 5
ntimestep= 10
a_final= 1.0
-- output_redshifts= {0.73, 0.6, 0.44, 0.0}  -- redshifts of output
output_redshifts= {1.0, 0.5, 0.0}  -- redshifts of output

omega_m = 0.307115
h       = 0.6777
sigma8  = 0.8228

pm_nc_factor= 3            -- Particle Mesh grid pm_nc_factor*nc per dimension
np_alloc_factor= 1      -- Amount of memory allocated for particle
loglevel=2                 -- 0=debug, 1=verbose, 2=normal, ...
                           -- increase the value to reduce output msgs

-- powerspectrum= "camb0_matterpower.dat" -- Initial power spectrum: k P(k)
powerspectrum= "BigMDPL_matterpower.dat" -- Initial power spectrum: k P(k) ## generated by camb cola_default.ini, xiaodongli@181019

-- Options
--   Following outputs can be turned off by commenting out
--   fof, snapshot, subsample, coarse_grid

-- FoF halo catalogue
fof= "fof"                 -- base filename
linking_factor= 0.2        -- FoF linking length= linking_factor*mean_separation

-- Dark matter particle outputs (all particles)
-- snapshot= "snp"       -- comment out to suppress snapshot output

-- Dark matter particle subsample
subsample= "sub"        -- base filename
subsample_factor= 0.01     -- fraction of particles to output

-- Dark matter density grid
coarse_grid= "grid"     -- base filename
coarse_grid_nc= 256          -- number of grid per dimension

-- Output 2LPT initial condition at a_final/ntimestep
-- ntimestep=1 will only generate 2LPT field with no COLA steps.
-- initial= "init"


-- Use 8-byte long id for GADGET snapshot
write_longid= false -- true or false

