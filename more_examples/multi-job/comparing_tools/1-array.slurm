#!/bin/bash
#SBATCH --job-name=demo_array
#SBATCH --ntasks=1 --cpus-per-task=1
#SBATCH -A ap_course_hpc_intro
#SBATCH --time=00:05:00
#SBATCH --array=1-6

module purge
module load calcua/2025a
module load Python/3.13.1-GCCcore-14.2.0

echo $SLURM_JOB_NAME

# set variables by selecting the correct line in parameters.csv using sed
LINE=$(sed -n "$((SLURM_ARRAY_TASK_ID + 1))p" parameters.csv)
IFS=',' read -r id duration label <<< "$LINE"

export TASK_LABEL="$label"
python3 run_task.py "$id" "$duration"
