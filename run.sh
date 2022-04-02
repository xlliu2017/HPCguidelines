#!/bin/bash



#SBATCH --nodes=1  
#SBATCH --ntasks=1  
#SBATCH --job-name=DLCodeDemo  
#SBATCH --output=DLCodeDemo.out  
#SBATCH --error=DLCodeDemo.err  
#SBATCH --time=12:00:00  
#SBATCH --partition=batch  
#SBATCH --gres=gpu:a100:1 

# Change to your name (last name and first name, lower case, for example jianqingzhu).
cd ~/jianqingzhu/MgNet_code
pwd

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
git pull

eval "$(conda shell.bash hook)"

# Change to the name to your conda env.
conda activate anconda3 

python run.py
conda deactivate

# use .log to save all your results
git add *.out
git commit -a -m "KAUST has finished the test"
git push