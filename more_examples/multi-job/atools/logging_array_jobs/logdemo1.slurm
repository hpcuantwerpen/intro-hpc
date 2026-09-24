#!/bin/bash
#
#SBATCH --ntasks=1 --cpus-per-task=1 --mem-per-cpu=512M
#SBATCH --time=10:00
#
# The idea of this script is to run 100 tasks.
# * The first 80 will show random failures
# * The next 10 will start but not produce a failed or completed log line
#   as if they got interrupted during execution.
# * Task 91 and further will not even show up with a start line in the 
#   log file as if they were never executed.
#

ml atools/1.5.1

# log start of work item execution
if (( $SLURM_ARRAY_TASK_ID <= 90 )); then
  alog --state start
fi

# Generate a random exit code using the special variable $RANDOM
# that we will use later.
exit_code=$(( $RANDOM % 2 ))

if (( $SLURM_ARRAY_TASK_ID <= 80 )); then

  # Do some work
  echo "Item: $SLURM_ARRAY_TASK_ID, Job name: $SLURM_JOB_NAME, array job id: $SLURM_ARRAY_JOB_ID, job id: $SLURM_JOB_ID, exit code: $exit_code."

  # log end of work item execution
  alog --state end --exit "$exit_code"

fi
