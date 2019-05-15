import commands
for nowdir in commands.getoutput('ls /public/projects/simulation').split():
    print nowdir
    #commands.getoutput('ls /public/projects/simulation/'+nowdir+'/*.2pcf
    commands.getoutput('mkdir '+nowdir)
    commands.getoutput('rsync -avrP /public/projects/simulation/'+nowdir+'/*.2pcf '+nowdir)
    commands.getoutput('rsync -avrP /public/projects/simulation/'+nowdir+'/*.sh '+nowdir)
    commands.getoutput('rsync -avrP /public/projects/simulation/'+nowdir+'/*.lua '+nowdir) 
    commands.getoutput('rsync -avrP /public/projects/simulation/'+nowdir+'/*.py '+nowdir) 
    commands.getoutput('rsync -avrP /public/projects/simulation/'+nowdir+'/*.dat '+nowdir) 
    commands.getoutput('rsync -avrP /public/projects/simulation/'+nowdir+'/Makefile '+nowdir) 
for nowfile in ['Makefile', 'Note', 'configure', 'parameter_file', 'outputs', 'Makefile.sample']:
    commands.getoutput('rsync -avrP /public/projects/simulation/'+nowfile+'  ./') 
