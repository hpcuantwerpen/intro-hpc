#! /bin/bash
# Demo for analysing log files of a regular array job.

export SBATCH_ACCOUNT=ap_course_hpc_intro
module load atools/1.5.1-GCCcore-14.2.0

#
# Submit first batch of jobs
#

# Submitting the first job. The --wait is only there for demo purposes.
sbatch --wait --array 1-100 logdemo1.slurm

#
# Analyse the results of the first batch of jobs
#

# Calling arange with full options. It should list items with number higher than 80 as to do and a certain number of failed jobs.
arange -t 1-100 --log logdemo1.slurm.log* --summary --list_completed --list_failed

# Checking the output of arange as it would be used to restart for failed and incomplete jobs.
arange -t 1-100 --log logdemo1.slurm.log* --redo

# Listing only the completed items which is useful for areduce.
arange -t 1-100 --log logdemo1.slurm.log* --list_completed

#
# Submit second batch of jobs
#

# Submitting the second job: Re-run for failed and todo task items. The --wait is only there for demo purposes.
sbatch --wait --array $(arange -t 1-100 --log logdemo1.slurm.log* --redo) logdemo2.slurm

#
# Analyse the results of the first and second batch of jobs
#

# Calling arange with full options. All items should now be completed.
arange -t 1-100 --log logdemo1.slurm.log* logdemo2.slurm.log* --summary --list_completed --list_failed


