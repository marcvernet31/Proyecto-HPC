#!/bin/bash
#SBATCH --job-name=lu-mz
#SBATCH --output=lu-mz_%j.out
#SBATCH --error=lu-mz_%j.err
#SBTACH --nodes=8
#SBATCH --ntasks=16
#SBATCH --cpus-per-task=24
#SBATCH --qos=debug

# Modificad esta linea con vuestro PATH a los ejecutables
export NAS_PATH=bin
export I_MPI_DEBUG=5
export I_MPI_STATS=ipm
export I_MPI_STATS_FILE=$SLURM_JOB_NAME.$SLURM_JOB_ID.stats
srun $NAS_PATH/lu-mz.D.x



