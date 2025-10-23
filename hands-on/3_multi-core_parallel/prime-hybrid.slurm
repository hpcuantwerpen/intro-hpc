#!/bin/bash
#SBATCH --job-name prime-hybrid
#SBATCH -A ap_course_hpc_intro
#SBATCH --ntasks=4 --cpus-per-task=4

module --force purge
module load calcua/2024a
module load intel/2024a

# Compile (can be done on login-node as well)
mpiicpx -qopenmp prime-hybrid.cpp -o prime_hybrid

# OpenMP variables
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
export OMP_PROC_BIND=true

srun -n $SLURM_NTASKS -c $OMP_NUM_THREADS prime_hybrid > hybrid.out
