#!/bin/bash
#SBATCH --job-name=demo_srun
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=3
#SBATCH -A ap_course_hpc_intro
#SBATCH --time=00:05:00

module purge
module load calcua/2025a
module load Python/3.13.1-GCCcore-14.2.0

echo $SLURM_JOB_NAME

# Loop through CSV and dispatch tasks across the (multi-node) allocation
for LINE in $(tail -n +2 parameters.csv); do
    IFS=',' read -r id duration label <<< "$LINE"
    export TASK_LABEL="$label"
    srun -N 1 -n 1 --exclusive python3 run_task.py "$id" "$duration" &
done

wait
echo "All multi-node srun tasks completed."
