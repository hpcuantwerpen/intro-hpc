#!/bin/bash
#SBATCH --job-name=demo_parallel
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=3
#SBATCH -A ap_course_hpc_intro
#SBATCH --time=00:05:00

module purge
module load calcua/2025a
module load parallel/20250722-GCCcore-14.2.0
module load Python/3.13.1-GCCcore-14.2.0

echo $SLURM_JOB_NAME

# Use parallel to manage local task concurrency, wrapped with srun for multi-node awareness
parallel --colsep ',' --skip-first-line --jobs +0 \
    env TASK_LABEL={3} srun -N1 -n1 --exclusive python3 run_task.py {1} {2} \
    :::: parameters.csv
