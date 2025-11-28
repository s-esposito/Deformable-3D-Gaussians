DATA_ROOT=/home/stefano/Codebase/DynSLAM/data
DATASET_NAME=nerfies
SCENE_NAME=toby-sit

# conda activate deformable_gaussian_env

python train.py -s $DATA_ROOT/$DATASET_NAME/$SCENE_NAME -m output/$DATASET_NAME/$SCENE_NAME --eval --is_6dof --iterations 20000 -r 4
python render.py --source_path $DATA_ROOT/$DATASET_NAME/$SCENE_NAME --model_path output/$DATASET_NAME/$SCENE_NAME --eval --is_6dof -r 4
python metrics.py --model_path output/$DATASET_NAME/$SCENE_NAME


