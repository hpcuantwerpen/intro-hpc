#!/bin/bash
#
#SBATCH --ntasks=1 --cpus-per-task=1 --mem-per-cpu=512M
#SBATCH --time=10:00

ml atools/1.5.1

# log start of work item execution
alog --state start

# This is for the second run, we'll now make sure they all succeed.
exit_code=0

# Do some work
echo "Item: $SLURM_ARRAY_TASK_ID, Job name: $SLURM_JOB_NAME, array job id: $SLURM_ARRAY_JOB_ID, job id: $SLURM_JOB_ID, exit code: $exit_code."

# log end of work item execution
alog --state end --exit "$exit_code"
