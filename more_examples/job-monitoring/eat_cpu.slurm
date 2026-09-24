#!/bin/bash
#SBATCH --job-name eat_cpu
#SBATCH -A ap_course_hpc_intro
#SBATCH -n 4
#SBATCH -t 10:00

module purge
module load calcua/2025a
module load vsc-tutorial/202510-intel-2025a

srun -n4 eat_cpu
