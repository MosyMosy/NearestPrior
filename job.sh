#!/bin/bash
#SBATCH --mail-user=Moslem.Yazdanpanah@gmail.com
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-type=REQUEUE
#SBATCH --mail-type=ALL
#SBATCH --job-name=nearestprior
#SBATCH --output=%x-%j.out
#SBATCH --nodes=1
#SBATCH --gres=gpu:1
#SBATCH --ntasks-per-node=32
#SBATCH --mem=127000M
#SBATCH --time=1-00:00
#SBATCH --account=rrg-ebrahimi

nvidia-smi

source ~/envs/ENV/bin/activate

echo "------------------------------------< Data preparation>----------------------------------"
echo "Copying the source code"
date +"%T"
cd $SLURM_TMPDIR
cp -r ~/scratch/NearestPrior .

echo "Copying the datasets"
date +"%T"
cp ~/scratch/DA_Dataset/office.tar.gz .
cp ~/scratch/DA_Dataset/officehome.zip .
cp ~/scratch/DA_Dataset/visda17/train.tar .
cp ~/scratch/DA_Dataset/visda17/validation.tar .

echo "creating data directories"
date +"%T"
cd NearestPrior
mkdir data
cd data
tar -xzf $SLURM_TMPDIR/office.tar.gz
unzip -q $SLURM_TMPDIR/officehome.zip
mkdir visda
cd visda
tar -xf $SLURM_TMPDIR/train.tar
tar -xf $SLURM_TMPDIR/validation.tar



echo "----------------------------------< End of data preparation>--------------------------------"
date +"%T"
echo "--------------------------------------------------------------------------------------------"

echo "---------------------------------------<Run the program>------------------------------------"
date +"%T"
cd $SLURM_TMPDIR
cd NearestPrior

sh script/run_office_obda.sh $gpu-id configs/office-train-config_ODA.yaml

echo "-----------------------------------<End of run the program>---------------------------------"
date +"%T"
echo "--------------------------------------<backup the result>-----------------------------------"
date +"%T"
# cd $SLURM_TMPDIR
# cp -r $SLURM_TMPDIR/Nearest-Prior/logs/$title ~/scratch/Nearest-Prior/logs/
# cp -r $SLURM_TMPDIR/Nearest-Prior/wandb/ ~/scratch/Nearest-Prior/