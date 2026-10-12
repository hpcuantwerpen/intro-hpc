#!/bin/bash

module load atools/1.5.1-GCCcore-14.2.0
sbatch --array $(arange --data data.csv) weather.slurm
