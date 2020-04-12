#!/bin/bash
#SBATCH --job-name=bt-mz
#SBATCH --output=bt-mz_%j.out
#SBATCH --error=bt-mz_%j.err
#SBTACH --nodes=4
#SBATCH --ntasks=192
#SBATCH --cpus-per-task=1
#SBATCH --qos=debug

# Modificad esta linea con vuestro PATH a los ejecutables
export NAS_PATH=bin
export I_MPI_DEBUG=5
export I_MPI_STATS=ipm
export I_MPI_STATS_FILE=$SLURM_JOB_NAME.$SLURM_JOB_ID.stats
srun $NAS_PATH/bt-mz.D.x

