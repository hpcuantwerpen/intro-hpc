#!/bin/bash
#SBATCH --job-name hybrid_hello
#SBATCH -A ap_course_hpc_intro
#SBATCH --ntasks=8 --cpus-per-task=16
#SBATCH --partition=zen2 --nodes=2
#SBATCH --mem-per-cpu=1g

module --force purge
module load calcua/2025a
module load vsc-tutorial/202510-intel-2025a

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
export OMP_PROC_BIND=true
srun -c $OMP_NUM_THREADS mpi_omp_hello
