#!/bin/bash
#SBATCH --job-name=OpenMP-demo
#SBATCH -A ap_course_hpc_intro
#SBATCH --ntasks=1 --cpus-per-task=64
#SBATCH --mem-per-cpu=2g

module --force purge
module load calcua/2025a
module load vsc-tutorial/202510-intel-2025a

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
export OMP_PROC_BIND=true
omp_hello
