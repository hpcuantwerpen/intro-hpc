#!/bin/bash
#SBATCH --job-name=demo_atools
#SBATCH --ntasks=1 --cpus-per-task=1
#SBATCH -A ap_course_hpc_intro
#SBATCH --time=00:05:00

module purge
module load calcua/2025a
module load atools/1.5.1-GCCcore-14.2.0
module load Python/3.13.1-GCCcore-14.2.0

echo $SLURM_JOB_NAME

# Variables from the header of parameters.csv are set to the correct line using aenv
source <(aenv --data parameters.csv)

export TASK_LABEL="$label"
python3 run_task.py "$task_id" "$duration"
