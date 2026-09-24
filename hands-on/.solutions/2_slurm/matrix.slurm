#!/bin/bash
#SBATCH --job-name=matrix_multiply    # Job name
#SBATCH --time=00:15:00               # Max time (15 minutes)
#SBATCH -A ap_course_hpc_intro
#SBATCH --ntasks=1 --cpus-per-task=10
#SBATCH -o %x.%j.out
#SBATCH --mail-type=END

# Load necessary module (OpenMP support via GCC - in the foss toolchain)
module purge
module load calcua/2025a
module load foss/2025a

# Compile the program
gcc -fopenmp matrix_multiply.c -o matrix_multiply

# Parallelisation (OpenMP) parameters
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
export OMP_PROC_BIND=true

# Run the program
./matrix_multiply
sleep 300
